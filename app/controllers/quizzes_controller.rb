class QuizzesController < ApplicationController
  respond_to :html, :json

  def index
    if cannot? :read, Quiz # Список тестов
      redirect_to "http://localhost:3000/403"
    else
      @quizzes = Quiz.all
    end
  end

  def new
    if cannot? :create, Quiz # Создать тест
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.new
      respond_modal_with @quiz
    end
  end

  def edit
    if cannot? :edit, Quiz # Изменить тест
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:id]
      respond_modal_with @quiz
    end
  end

  def create
    if cannot? :create, Quiz # Создать тест
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.new quiz_params
      if @quiz.save
        respond_modal_with @quiz, location: quizzes_path
      else
        respond_modal_with @quiz, location: new_quiz_path
      end
    end
  end

  def update
    if cannot? :create, Quiz # Изменить тест
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:id]

      if @quiz.update quiz_params
        respond_modal_with @quiz, location: quizzes_path
      else
        respond_modal_with @quiz, location: new_quiz_path
      end
    end
  end

  def destroy
    if cannot? :destroy, Quiz # Изменить тест
      redirect_to "http://localhost:3000/403"
    else
      @quiz = Quiz.find params[:id]
      @quiz.destroy
      redirect_to quizzes_path
    end
  end

  # GET /quizzes/:id
  def perform
    @quiz = Quiz.find params[:id]
    @questions = @quiz.questions.all
  end

  # POST /quizzes/:id
  def finish
    redirect_to '/403'
  end

  private

  def quiz_params
    params.require(:quiz)
        .permit(:title, :description)
  end
end
