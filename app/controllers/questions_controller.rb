class QuestionsController < ApplicationController
  respond_to :html, :json

  def index
    if cannot? :read, Question # Список вопросов
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @questions = @quiz.questions.all
    end
  end

  def new
    if cannot? :create, Question # Создать вопрос
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.new
      respond_modal_with @quiz, @question
    end
  end

  def create
    if cannot? :create, Question # Создать вопрос
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.new question_params

      if @question.save
        respond_modal_with @quiz, location: quiz_questions_path
      else
        respond_modal_with @quiz, @question, location: new_quiz_question_path
      end
    end
  end

  def edit
    if cannot? :edit, Question # Изменить вопрос
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.find params[:id]
      respond_modal_with @quiz, @question
    end
  end

  def update
    if cannot? :edit, Question # Изменить вопрос
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.find params[:id]

      if @question.update question_params
        respond_modal_with @quiz, location: quiz_questions_path
      else
        respond_modal_with @quiz, @question, location: edit_quiz_question_path
      end
    end
  end

  def destroy
    if cannot? :destroy, Question # Удалить вопрос
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:quiz_id]
      @question = @quiz.questions.find params[:id]
      @question.destroy
      redirect_to quiz_questions_path @quiz
    end
  end

  private

  def question_params
    params.require(:question).permit(:question)
  end
end
