class QuizPerformsController < ApplicationController
  def index
    not_found and return unless params[:quiz_id].present?

    @quiz = Quiz.find params[:quiz_id]
    @performs = current_user.quiz_performs.where quiz_id: params[:quiz_id]
  end

  def new
    not_found and return unless params[:quiz_id].present?

    @quiz = Quiz.find params[:quiz_id]
    @questions = @quiz.questions.all
  end

  # noinspection RailsChecklist01
  def create
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

    @quiz = Quiz.find params[:quiz_id]
    questions = @quiz.questions.all
    quiz_perform = QuizPerform.find params[:perform_id]

    @successful = true

    @view_data = Array.new
    questions.each do |question|
      question_answers = quiz_perform.question_answers.where question_id: question.id
      answers = question_answers.map {|qa| qa.answer }

      right_count = question.answers.where(right: true).count
      user_right_count = answers.count { |a| a.right }

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
end
