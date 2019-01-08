class QuestionsController < ApplicationController
  respond_to :html, :json

  def index
    @quiz = Quiz.find params[:quiz_id]
    @questions = @quiz.questions.all
  end

  def new
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.new
    respond_modal_with @quiz, @question
  end

  def create
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.new question_params

    if @question.save
      respond_modal_with @quiz, location: quiz_questions_path
    else
      respond_modal_with @quiz, @question, location: new_quiz_question_path
    end
  end

  def edit
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:id]
    respond_modal_with @quiz, @question
  end

  def update
    @quiz = Quiz.find params[:quiz_id]
    @question = @quiz.questions.find params[:id]

    if @question.update question_params
      respond_modal_with @quiz, location: quiz_questions_path
    else
      respond_modal_with @quiz, @question, location: edit_quiz_question_path
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
