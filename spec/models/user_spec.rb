require 'rails_helper'

RSpec.describe User, type: :model do
  subject{User.create(name: 'Reza', photo: 'photo://path', bio: 'My bio')}

  before{ subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counte should be integer' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'three_most_recent_posts should return 3 posts' do
    user = User.create(name: 'Reza', photo: 'photo://path', bio: 'My bio', posts_counter: 0)
    7.times do |i|
      Post.create(author: user, title: 'Test title', text: 'Test text', comments_counter: 0, likes_counter: 0)
    end
    expect(user.three_most_recent_posts.count).to eq(3)
  end
end
