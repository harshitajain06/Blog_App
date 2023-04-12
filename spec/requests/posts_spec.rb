require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) do
      @user = User.create(name: 'Dev', photo: 'myPhoto', bio: 'myBio', post_counter: 0)
      @post = Post.create(title: 'myTitle', text: 'Hello', author: @user, comments_counter: 0, likes_counter: 0)
      get user_posts_path(@user)
    end
    it 'returns a successful response' do
      get user_posts_path(@user)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_posts_path(@user)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(@user)
      expect(response.body).to include('myTitle')
    end
  end
  describe 'GET /show' do
    before(:example) do
      @user = User.create(name: 'Dev', photo: 'myPhoto', bio: 'myBio', post_counter: 0)
      @post = Post.create(title: 'myTitle', text: 'Hello', author: @user, comments_counter: 0, likes_counter: 0)
      get user_post_path(@user, @post)
    end
    it 'returns a successful response' do
      get user_post_path(@user, @post)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_post_path(@user, @post)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_post_path(@user, @post)
      expect(response.body).to include('Create new comment')
    end
  end
end
