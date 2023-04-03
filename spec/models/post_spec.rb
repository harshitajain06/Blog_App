require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:example) do
    @user = User.create(name: 'Dev', photo: 'myPhoto', bio: 'myBio', post_counter: 0)
    @post = Post.create(title: 'myTitle', text: 'Hello', author: @user, comments_counter: 0, likes_counter: 0)
  end

  it 'title is invalid' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'comments_counter is invalid' do
    @post.comments_counter = 'asdasdasd'
    expect(@post).to_not be_valid
  end

  it 'comments_counter is invalid' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end

  it 'like_counter is invalid' do
    @post.likes_counter = 'asdasdasd'
    expect(@post).to_not be_valid
  end

  it 'like_counter is invalid' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end

  it 'recent_comments should return 3 comments' do
    Comment.create(text: 'comment', post: @post, author: @user)
    Comment.create(text: 'comment_1', post: @post, author: @user)
    Comment.create(text: 'comment_2', post: @post, author: @user)
    Comment.create(text: 'comment_3', post: @post, author: @user)
    expect(@post.recent_comments.count).to eq(4)
  end
end
