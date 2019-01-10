# -*- encoding: utf-8 -*-

require 'rails_helper'

describe QuestionsController do

  # TODO: auto-generated
  describe 'GET index' do
    it 'works' do
      expect(:get => "/quizzes/:quiz_id/questions").to route_to(
	:controller => "questions",
	:action => "index",
        :quiz_id => ":quiz_id"
      )
    end
  end

  # TODO: auto-generated
  describe 'GET new' do
    it 'works' do
      expect(:get => "/quizzes/:quiz_id/questions/new").to route_to(
	:controller => "questions",
	:action => "new",
        :quiz_id => ":quiz_id"
      )
    end
  end

  # TODO: auto-generated
  describe 'POST create' do
    it 'works' do
      expect(:post => "/quizzes/:quiz_id/questions").to route_to(
	:controller => "questions",
	:action => "create",
        :quiz_id => ":quiz_id"
      )
    end
  end

  # TODO: auto-generated
  describe 'GET edit' do
    it 'works' do
      expect(:get => "/quizzes/:quiz_id/questions/:id/edit").to route_to(
	:controller => "questions",
	:action => "edit",
        :quiz_id => ":quiz_id",
        :id => ":id"
      )
    end
  end

  # TODO: auto-generated
  describe 'PUT update' do
    it 'works' do
      expect(:put => "/quizzes/:quiz_id/questions/:id").to route_to(
	:controller => "questions",
	:action => "update",
        :quiz_id => ":quiz_id",
        :id => ":id"
      )
    end
  end

  # TODO: auto-generated
  describe 'DELETE destroy' do
    it 'works' do
      expect(:delete => "/quizzes/:quiz_id/questions/:id").to route_to(
	:controller => "questions",
	:action => "destroy",
        :quiz_id => ":quiz_id",
        :id => ":id"
      )
    end
  end

end
