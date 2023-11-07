require 'rails_helper'

RSpec.describe 'Users show page', type: :feature do
  before :each do
    @user = User.create(name: 'User 1', photo: 'https://picsum.photos/300/300', bio: 'User 1 bio', posts_counter: 0)
    @post1 = Post.create(title: 'Post 1', text: 'Post 1 text', author: @user, comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(title: 'Post 2', text: 'Post 2 text', author: @user, comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(title: 'Post 3', text: 'Post 3 text', author: @user, comments_counter: 0, likes_counter: 0)
    visit("/users/#{@user.id}")
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

  scenario 'I can see the users bio.' do
    expect(page).to have_content('Bio')
  end

  scenario 'I can see the users first 3 posts.' do
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  scenario 'I can see a button that lets me view all of a users posts.' do
    expect(page).to have_content('See all posts')
  end

  scenario 'When I click a users post, it redirects me to that posts show page.' do
    click_link @post1.title do
      expect(page).to have_current_path("/users/#{@user.id}/posts/#{@post1.id}")
    end
  end

  scenario 'When I click the see all posts button, it redirects me to that users posts index page.' do
    click_link 'See all posts' do
      expect(page).to have_current_path("/users/#{@user.last.id}/posts")
    end
  end
end