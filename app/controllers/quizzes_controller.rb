require_relative '../models/quiz'

class QuizzesController < ApplicationController
  respond_to :html, :json

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
    respond_modal_with @quiz
  end

  def edit
    @quiz = Quiz.find params[:id]
    respond_modal_with @quiz
  end

  def create
    @quiz = Quiz.new quiz_params
    if @quiz.save
      respond_modal_with @quiz, location: quizzes_path
    else
      respond_modal_with @quiz, location: new_quiz_path
    end
  end

  def update
    @quiz = Quiz.find params[:id]

    if @quiz.update quiz_params
      respond_modal_with @quiz, location: quizzes_path
    else
      respond_modal_with @quiz, location: new_quiz_path
    end
  end

  def show
    @quiz = Quiz.find params[:id]
  end

  def destroy
    @quiz = Quiz.find params[:id]
    @quiz.destroy

    redirect_to quizzes_path
  end

  private

  def quiz_params
    params.require(:quiz)
          .permit(:title, :description)
  end
end
