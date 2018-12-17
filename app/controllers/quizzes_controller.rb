require_relative '../models/quiz'

class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def new
  end

  def create
    @quiz = Quiz.new quiz_params
    @quiz.save
    redirect_to @quiz
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
