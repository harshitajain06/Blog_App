require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users'
      expect(response.body).to include('All the users')
    end
  end
end
