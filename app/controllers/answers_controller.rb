class AnswersController < ApplicationController
  respond_to :html, :json

  def index
    if cannot? :read, Answer # Список вопросов
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.find params[:question_id]
      @answers = @question.answers.all
    end
  end

  def new
    if cannot? :create, Answer # Создать вопрос
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.find params[:question_id]
      @answer = @question.answers.new
      respond_modal_with @quiz, @question, @answer
    end
  end

  def create
    if cannot? :create, Answer # Создать вопрос
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.find params[:question_id]
      @answer = @question.answers.new answer_params

      if @answer.save
        respond_modal_with @quiz, @question, location: quiz_question_answers_path
      else
        respond_modal_with @quiz, @question, @answer, location: new_quiz_question_answer_path
      end
    end
  end

  def edit
    if cannot? :edit, Answer # Создать вопрос
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.find params[:question_id]
      @answer = @question.answers.find params[:id]
      respond_modal_with @quiz, @question, @answer
    end
  end

  def update
    if cannot? :edit, Answer # Создать вопрос
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.find params[:question_id]
      @answer = @question.answers.find params[:id]
      if @answer.update answer_params
        respond_modal_with @quiz, @question, location: quiz_question_answers_path
      else
        respond_modal_with @quiz, @question, @answer, location: edit_quiz_question_answer_path
      end
    end
  end

  def destroy
    if cannot? :destroy, Answer # Создать вопрос
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.find params[:question_id]
      @answer = @question.answers.find params[:id]
      @answer.destroy
      redirect_to quiz_question_answers_path(@quiz, @question)
    end
  end

  private

  def answer_params
    params.require(:answer)
        .permit(:title, :right)
  end
end
