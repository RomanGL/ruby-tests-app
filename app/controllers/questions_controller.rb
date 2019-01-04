require_relative '../models/quiz'
require_relative '../models/question'

class QuestionsController < ApplicationController
  def index
    @quiz = Quiz.find params[:quiz_id]
    @questions = @quiz.questions.all
  end

  def new
    @quiz = Quiz.find params[:quiz_id]
    @question = Question.new
  end

  def create
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.create question_params

    redirect_to quiz_question_path(@quiz, @question)
  end

  def show
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:id]
  end

  def edit
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:id]
  end

  def update
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:id]

    if @question.update question_params
      redirect_to quiz_question_path(@quiz, @question)
    else
      render 'edit'
    end
  end

  def destroy
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:id]
    @question.destroy

    redirect_to quiz_questions_path @quiz
  end

  private

  def question_params
    params.require(:question).permit(:question)
  end
end
