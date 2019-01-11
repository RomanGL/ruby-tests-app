# -*- encoding: utf-8 -*-

require 'rails_helper'

describe QuizPerformsController do

  # TODO: auto-generated
  describe 'GET index' do
    it 'works' do
      expect(:get => "/quiz_performs/:quiz_id").to route_to(
	:controller => "quiz_performs",
	:action => "index",
        :quiz_id => ":quiz_id"
      )
    end
  end

  # TODO: auto-generated
  describe 'GET new' do
    it 'works' do
      expect(:get => "/quiz_performs/:quiz_id/new").to route_to(
	:controller => "quiz_performs",
	:action => "new",
        :quiz_id => ":quiz_id"
      )
    end
  end

  # TODO: auto-generated
  describe 'POST create' do
    it 'works' do
      expect(:post => "/quiz_performs/:quiz_id").to route_to(
	:controller => "quiz_performs",
	:action => "create",
        :quiz_id => ":quiz_id"
      )
    end
  end

  # TODO: auto-generated
  describe 'GET show' do
    it 'works' do
      expect(:get => "/quiz_performs/:quiz_id/:perform_id").to route_to(
	:controller => "quiz_performs",
	:action => "show",
        :quiz_id => ":quiz_id",
	:perform_id => ":perform_id"
      )
    end
  end

  # TODO: auto-generated
  describe 'DELETE destroy' do
    it 'works' do
      expect(:delete => "/quiz_performs/:quiz_id/:perform_id").to route_to(
	:controller => "quiz_performs",
	:action => "destroy",
        :quiz_id => ":quiz_id",
	:perform_id => ":perform_id"
      )
    end
  end

end
