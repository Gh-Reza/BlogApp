require 'rails_helper'

RSpec.describe 'Users show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'User 1', photo: 'https://picsum.photos/300/300', bio: 'User 1 bio', posts_counter: 0)
    @post = Post.create(title: 'Post 1', text: 'Post 1 text', author: @user, comments_counter: 0, likes_counter: 0)

    @comment1 = Comment.create(user_id: @user.id, post_id: @post.id, text: 'Comment 1')
    @comment2 = Comment.create(user_id: @user.id, post_id: @post.id, text: 'Comment 2')
    @comment3 = Comment.create(user_id: @user.id, post_id: @post.id, text: 'Comment 3')

    Like.create(user_id: @user.id, post_id: @post.id)
    Like.create(user_id: @user.id, post_id: @post.id)
    Like.create(user_id: @user.id, post_id: @post.id)
    visit user_post_path(@user, @post)
  end

  scenario 'I can see the posts title.' do
    expect(page).to have_content(@post.title)
  end

  scenario 'I can see who wrote the post.' do
    expect(page).to have_content(@user.name)
  end

  scenario 'I can see how many comments it has.' do
    expect(page).to have_content('Comments: 3')
  end

  scenario 'I can see how many likes it has.' do
    expect(page).to have_content('Likes: 3')
  end

  scenario 'I can see the posts body.' do
    expect(page).to have_content(@post.text)
  end

  scenario 'I can see the username of each commentor.' do
    expect(page).to have_content(@user.name)
  end

  scenario 'I can see the comment each commentor left.' do
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
      expect(page).to have_content(@comment3.text)
  end
end