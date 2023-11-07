require 'rails_helper'

RSpec.describe 'Posts index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'User 1', photo: 'https://picsum.photos/300/300', bio: 'User 1 bio', posts_counter: 0)
    @post1 = Post.create(title: 'Post 1', text: 'Post 1 text', author: @user, comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(title: 'Post 2', text: 'Post 2 text', author: @user, comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(title: 'Post 3', text: 'Post 3 text', author: @user, comments_counter: 0, likes_counter: 0)

    Comment.create(user_id: @user.id, post_id: @post1.id, text: 'Comment 1')
    Comment.create(user_id: @user.id, post_id: @post1.id, text: 'Comment 2')
    Comment.create(user_id: @user.id, post_id: @post1.id, text: 'Comment 3')

    Like.create(user_id: @user.id, post_id: @post1.id)
    Like.create(user_id: @user.id, post_id: @post1.id)
    Like.create(user_id: @user.id, post_id: @post1.id)

    visit user_posts_path(@user)
  end

  scenario 'I can see the users profile picture.' do
    profile = all('img')
    expect(profile.size).to eq(1)
  end

  scenario 'I can see the users name.' do
    expect(page).to have_content(@user.name)
  end

  scenario 'I can see the number of posts the user has written.' do
    expect(page).to have_content('Number of posts: 3')
  end

  scenario 'I can see a posts title.' do
    expect(page).to have_content(@post1.title)
  end

  scenario 'I can see some of the posts body.' do
    expect(page).to have_content(@post1.text)
  end

  scenario 'I can see the first comments on a post.' do
    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comment 2')
    expect(page).to have_content('Comment 3')
  end

  scenario 'I can see how many comments a post has.' do
    expect(page).to have_content('Comments: 3')
  end

  scenario 'I can see how many likes a post has.' do
    expect(page).to have_content('Likes: 3')
  end

  scenario 'When I click on a post, it redirects me to that posts show page.' do
    click_link @post1.title do
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
  end
end
