require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do
    context 'GET #not_found' do 
        it 'returns a success response' do
	    get :not_found
	end
    end	
    context 'GET #forbidden' do 
        it 'returns a success response' do
	    get :forbidden
	end
    end
    context 'GET #internal_server_error' do 
        it 'returns a success response' do
	    get :internal_server_error
	end
    end	
end
