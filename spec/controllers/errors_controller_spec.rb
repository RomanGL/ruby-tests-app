# -*- encoding: utf-8 -*-

require 'rails_helper'

describe ErrorsController do

  # TODO: auto-generated
  describe 'GET not_found' do
    it 'works' do
      get :not_found, {}
      expect(response.status).to eq(404)
    end
  end

  # TODO: auto-generated
  describe 'GET forbidden' do
    it 'works' do
      get :forbidden, {}
      expect(response.status).to eq(403)
    end
  end

  # TODO: auto-generated
  describe 'GET internal_server_error' do
    it 'works' do
      get :internal_server_error, {}
      expect(response.status).to eq(500)
    end
  end

end
