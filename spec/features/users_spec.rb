require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'GET /index' do
    before(:example) do
      @user = User.create(name: 'De', photo: 'myPhoto', bio: 'myBio', post_counter: 0)
      @user1 = User.create(name: 'Dev1', photo: 'myPhoto1', bio: 'myBio1', post_counter: 0)
      visit users_path
    end

    it 'I can see the username of all other users' do
      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'shows the profile picture for each user' do
      User.all.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'shows the number of posts each user has written' do
      User.all.each do |_user|
        expect(page).to have_content('Number of posts: 0')
      end
    end

    it 'redirects to the user show page when a user is clicked' do
      click_link('Dev1')
      expect(page).to have_current_path(user_path(@user1))
    end
  end

  describe 'GET /show' do
    before(:example) do
      @user = User.create(name: 'De', photo: 'myPhoto', bio: 'myBio', post_counter: 0)
      @user1 = User.create(name: 'Dev1', photo: 'myPhoto1', bio: 'myBio1', post_counter: 0)
      @post = Post.create(title: 'myTitle', text: 'Hello', author: @user, comments_counter: 0, likes_counter: 0)
      @post1 = Post.create(title: 'myTitle1', text: 'Hello1', author: @user, comments_counter: 0,
                           likes_counter: 0)
      @post2 = Post.create(title: 'myTitle2', text: 'Hello2', author: @user, comments_counter: 0,
                           likes_counter: 0)
      visit users_path
    end

    it 'shows the user profile picture' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    it 'shows the user username' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 3')
    end

    it 'shows the user bio' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the user first 3 posts' do
      expect(page.find_all('li').length).to eq(5)
    end

    it 'redirects to the post show page when a post is clicked' do
      click_link('Dev1')
      expect(page).to have_current_path(user_path(@user1))
    end

    it 'redirects to the user posts index page when all posts are viewed' do
      visit user_path(@user1)
      click_link('See all Posts')
      expect(page).to have_current_path(user_posts_path(@user1))
    end
  end
end
