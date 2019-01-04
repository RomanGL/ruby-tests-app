require_relative '../models/quiz'
require_relative '../models/question'
require_relative '../models/answer'

class AnswersController < ApplicationController
  def index
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:question_id]
    @answers = @question.answers.all
  end

  def new
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:question_id]
    @answer = Answer.new
  end

  def create
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:question_id]
    @answer = @question.answers.new answer_params

    if @answer.save
      redirect_to quiz_question_answer_path(@quiz, @question, @answer)
    else
      render 'new'
    end
  end

  def show
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:question_id]
    @answer = @question.answers.find params[:id]
  end

  def edit
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:question_id]
    @answer = @question.answers.find params[:id]
  end

  def update
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:question_id]
    @answer = @question.answers.find params[:id]

    if @answer.update answer_params
      redirect_to quiz_question_answer_path(@quiz, @question, @answer)
    else
      render 'edit'
    end
  end

  def destroy
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:question_id]
    @answer = @question.answers.find params[:id]

    @answer.destroy

    redirect_to quiz_question_answers_path(@quiz, @question)
  end

  private

  def answer_params
    params.require(:answer)
        .permit(:title, :right)
  end
end
