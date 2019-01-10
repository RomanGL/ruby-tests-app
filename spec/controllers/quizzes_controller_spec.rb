# -*- encoding: utf-8 -*-

require 'rails_helper'

describe QuizzesController do

  # TODO: auto-generated
  describe 'GET index' do
    it 'works' do
      expect(:get => "/quizzes").to route_to(
	:controller => "quizzes",
	:action => "index",
      )
    end
  end

  # TODO: auto-generated
  describe 'GET new' do
    it 'works' do
      expect(:get => "/quizzes/new").to route_to(
	:controller => "quizzes",
	:action => "new"
      )
    end
  end

  # TODO: auto-generated
  describe 'GET edit' do
    it 'works' do
      expect(:get => "/quizzes/:id/edit").to route_to(
	:controller => "quizzes",
	:action => "edit",
	:id => ":id"
      )
    end
  end

  # TODO: auto-generated
  describe 'POST create' do
    it 'works' do
      expect(:post => "/quizzes").to route_to(
	:controller => "quizzes",
	:action => "create"
      )
    end
  end

  # TODO: auto-generated
  describe 'PUT update' do
    it 'works' do
      expect(:patch => "/quizzes/:id").to route_to(
	:controller => "quizzes",
	:action => "update",
	:id => ":id"
      )
    end
  end

  # TODO: auto-generated
  describe 'DELETE destroy' do
    it 'works' do
      expect(:delete => "/quizzes/:id").to route_to(
	:controller => "quizzes",
	:action => "destroy",
	:id => ":id"
      )
    end
  end

end
