require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:example) do
    @user = User.create(name: 'Dev', photo: 'myPhoto', bio: 'myBio', post_counter: 0)
    @post = Post.create(title: 'myTitle', text: 'Hello', author: @user, comments_counter: 0, likes_counter: 0)
    @like = Like.new(post: @post)
    @like.save
  end

  it 'have correct post' do
    expect(@like.posts_id).to eq(@post.id)
  end

  it 'test if like counter is updated' do
    expect(@post.likes_counter).to eq 0
  end
end
