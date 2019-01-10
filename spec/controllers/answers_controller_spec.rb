# -*- encoding: utf-8 -*-

require 'rails_helper'

describe AnswersController do

  # TODO: auto-generated
  describe 'GET index' do
    it 'works' do
      expect(:get => "/quizzes/:quiz_id/questions/:question_id/answers").to route_to(
	:controller => "answers",
	:action => "index",
        :quiz_id => ":quiz_id",
        :question_id => ":question_id"
      )
    end
  end

  # TODO: auto-generated
  describe 'GET new' do
    it 'works' do
      expect(:get => "/quizzes/:quiz_id/questions/:question_id/answers/new").to route_to(
	:controller => "answers",
	:action => "new",
        :quiz_id => ":quiz_id",
        :question_id => ":question_id"
      )
    end
  end

  # TODO: auto-generated
  describe 'POST create' do
    it 'works' do
      expect(:post => "/quizzes/:quiz_id/questions/:question_id/answers").to route_to(
	:controller => "answers",
	:action => "create",
        :quiz_id => ":quiz_id",
        :question_id => ":question_id"
      )
    end
  end

  # TODO: auto-generated
  describe 'GET edit' do
    it 'works' do
      expect(:get => "/quizzes/:quiz_id/questions/:question_id/answers/:id/edit").to route_to(
	:controller => "answers",
	:action => "edit",
        :quiz_id => ":quiz_id",
        :question_id => ":question_id",
        :id => ":id"
      )
    end
  end

  # TODO: auto-generated
  describe 'PUT update' do
    it 'works' do
      expect(:put => "/quizzes/:quiz_id/questions/:question_id/answers/:id").to route_to(
	:controller => "answers",
	:action => "update",
        :quiz_id => ":quiz_id",
        :question_id => ":question_id",
        :id => ":id"
      )
    end
  end

  # TODO: auto-generated
  describe 'DELETE destroy' do
    it 'works' do
      expect(:delete => "/quizzes/:quiz_id/questions/:question_id/answers/:id").to route_to(
	:controller => "answers",
	:action => "destroy",
        :quiz_id => ":quiz_id",
        :question_id => ":question_id",
        :id => ":id"
      )
    end
  end

end
