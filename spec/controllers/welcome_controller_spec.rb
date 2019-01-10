# -*- encoding: utf-8 -*-

require 'rails_helper'

describe WelcomeController do

  # TODO: auto-generated
  describe 'GET index' do
    it 'works' do
      get :index, {}
      expect(response.status).to eq(200)
    end
  end

end


#require 'rails_helper'

#RSpec.describe WelcomeController, type: :controller do
#    context 'GET #index' do 
#        it 'returns a success response' do
#	    get :index
#	    expect(response).to be_successful
#	end
#    end	
#end
