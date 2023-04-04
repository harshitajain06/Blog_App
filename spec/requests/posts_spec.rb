require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/users/:user_id/posts'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users/:user_id/posts'
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
end
