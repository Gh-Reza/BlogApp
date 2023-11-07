require 'rails_helper'

RSpec.describe 'Users index page', type: :feature do
  before do
    @user1 = User.create(name: 'User 1', photo: 'https://picsum.photos/300/300', bio: 'User 1 bio', posts_counter: 0)
    @user2 = User.create(name: 'User 2', photo: 'https://picsum.photos/300/300', bio: 'User 2 bio', posts_counter: 0)
    @user3 = User.create(name: 'User 3', photo: 'https://picsum.photos/300/300', bio: 'User 3 bio', posts_counter: 0)
    @user4 = User.create(name: 'User 4', photo: 'https://picsum.photos/300/300', bio: 'User 4 bio', posts_counter: 0)
    visit '/users'
  end

  scenario 'I can see the username of all other users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
    expect(page).to have_content(@user4.name)
  end

  scenario 'I can see the profile picture for each user.' do
    expect(page).to have_css("img[src*='https://picsum.photos/300/300']")
  end

  scenario 'I can see the number of posts each user has written.' do
    expect(page).to have_content('Number of posts: 0')
  end

  scenario 'When I click on a user, I am redirected to that users show page.' do
      click_link @user1.name do
        expect(page).to have_current_path("/users/#{User.last.id}")
      end
  end
end
