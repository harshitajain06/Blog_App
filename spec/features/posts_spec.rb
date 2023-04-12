require 'rails_helper'

RSpec.describe 'Posts', type: :request do
    describe 'GET /posts' do
        before(:example) do
          visit user_posts_path(@user)
        end
        it 'I can see the image' do
          expect(page.find('img')['src']).to have_content @user.photo
        end
        it 'I can see the username' do
          expect(page).to have_content('John Doe')
        end
        it 'I can see the number of posts' do
          expect(page).to have_content('Number of posts: 1')
        end
        it 'I can see the post title' do
          expect(page).to have_content('title')
        end
        it 'I can see the post content' do
          expect(page).to have_content('content')
        end
        it 'I can see the first of comments' do
          expect(page).to have_content('comment')
        end
        it 'I can see the number of comments' do
          expect(page).to have_content('Comments: 1')
        end
        it 'I can see the number of likes' do
          expect(page).to have_content('Likes: 1')
        end
        it 'when I click on the post title I can see the post' do
          find("a[href='/users/#{@user.id}/posts/#{@post.id}']").click
          sleep 1
          expect(current_path).to eq user_post_path(@user, @post)
        end
      end
end