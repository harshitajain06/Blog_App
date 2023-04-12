require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) do
      @user = User.create(name: 'Dev', photo: 'myPhoto', bio: 'myBio', post_counter: 0)
    end
  
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
      expect(response.body).to include('Dev')
    end
  end

  describe 'GET /show' do
    before(:example) do
      @user = User.create(name: 'Dev', photo: 'myPhoto', bio: 'myBio', post_counter: 0)
      get user_path(@user)
    end
  
    it 'returns a successful response' do
      get user_path(@user)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_path(@user)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_path(@user)
      expect(response.body).to include('Create post')
    end
  end
end
