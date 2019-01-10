class QuizPerformsController < ApplicationController
  def index
    not_found and return unless params[:quiz_id].present?
    forbidden and return unless user_signed_in?

    @quiz = Quiz.find params[:quiz_id]
    performs = current_user.quiz_performs.where quiz_id: params[:quiz_id]
    questions = @quiz.questions.all

    @quiz_successful = false

    current_user_performs = []
    performs.each do |perform|
      success = true

      questions.each do |question|
        break unless success

        question_answers = perform.question_answers.where question_id: question.id
        answers = question_answers.map {|qa| qa.answer}

        right_count = question.answers.where(right: true).count
        user_right_count = answers.count {|a| a.right}

        success = user_right_count == right_count
      end

      unless @quiz_successful
        @quiz_successful = success
      end

      current_user_performs <<
          {
              :perform => perform,
              :success => success
          }
    end

    @view_data =
        {
            :current_user => current_user_performs,
            :other_users => nil
        }

    return unless can_read_all_performs?

    @view_data[:other_users] = other_users_performs(questions)
  end

  def new
    not_found and return unless params[:quiz_id].present?

    @quiz = Quiz.find params[:quiz_id]
    @questions = @quiz.questions.all
  end

  # noinspection RailsChecklist01
  def create
    forbidden and return unless user_signed_in?
    not_found and return unless params[:quiz_id].present? &&
        params[:result].present?

    quiz_id = params[:quiz_id].to_i
    rollback = false

    QuizPerform.transaction do
      begin
        perform = QuizPerform.new quiz_id: quiz_id, user_id: current_user.id
        perform.save!

        params[:result].each do |result|
          question_id = result[0].to_i
          result[1].each do |answer_id|
            next if answer_id.empty?
            qa = QuestionAnswer.new quiz_perform_id: perform.id,
                                    question_id: question_id,
                                    answer_id: answer_id.to_i
            qa.save!
          end
        end
      rescue
        rollback = true
        raise ActiveRecord::Rollback, 'An error occurred while saving quiz perform.'
      end
    end

    if rollback
      internal_server_error
    else
      redirect_to quiz_performs_path quiz_id: quiz_id
    end
  end

  # noinspection RailsChecklist01
  def show
    not_found and return unless params[:quiz_id].present? &&
        params[:perform_id].present?

    quiz_perform = QuizPerform.find params[:perform_id]

    forbidden and return unless user_signed_in?
    forbidden and return unless can_read_all_performs? || current_user.id == quiz_perform.user_id

    @quiz = Quiz.find params[:quiz_id]
    questions = @quiz.questions.all
    @successful = true

    @view_data = []
    questions.each do |question|
      question_answers = quiz_perform.question_answers.where question_id: question.id
      answers = question_answers.map {|qa| qa.answer}

      right_count = question.answers.where(right: true).count
      user_right_count = answers.count {|a| a.right}

      if user_right_count < right_count
        @successful = false
      end

      @view_data <<
          {
              :question => question,
              :user_answers => answers,
              :right_count => right_count,
              :user_right_count => user_right_count
          }
    end
  end

  def destroy
    not_found and return unless params[:quiz_id].present? &&
        params[:perform_id].present?

    if cannot? :destroy, QuizPerform
      forbidden and return
    else
      quiz_perform = QuizPerform.find params[:perform_id]
      quiz_perform.destroy!
      redirect_to quiz_performs_path quiz_id: params[:quiz_id]
    end
  end

  private

  def other_users_performs(questions)
    other_users_performs = {}
    other_performs = @quiz.quiz_performs.where("user_id != #{current_user.id}")

    other_performs.each do |perform|
      success = true

      unless other_users_performs.has_key? perform.user_id
        user = User.find perform.user_id
        other_users_performs[perform.user_id] =
            {
                :user => user,
                :success => false,
                :performs => []
            }
      end

      questions.each do |question|
        break unless success

        question_answers = perform.question_answers.where question_id: question.id
        answers = question_answers.map {|qa| qa.answer}

        right_count = question.answers.where(right: true).count
        user_right_count = answers.count {|a| a.right}

        success = user_right_count == right_count
      end

      unless other_users_performs[perform.user_id][:success]
        other_users_performs[perform.user_id][:success] = success
      end

      other_users_performs[perform.user_id][:performs] <<
          {
              :perform => perform,
              :success => success
          }
    end

    other_users_performs
  end

  def can_read_all_performs?
    current_user.has_role? :admin
  end
end
