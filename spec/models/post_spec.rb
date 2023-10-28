require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Reza', photo: 'photo://path', bio: 'My bio', posts_counter: 0)
  subject { Post.create(author: user, title: 'Test title', text: 'Test text', comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be less than 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments counte should be integer' do
    subject.comments_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'likes counte should be integer' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'five_most_recent_comments should return 5 comments' do
    7.times do |_i|
      subject.comments.create(user:, post: subject, text: 'Test text')
    end
    expect(subject.five_most_recent_comments.count).to eq(5)
  end

  it 'update_post_counter should increment posts_counter' do
    expect { subject.send(:update_post_counter) }.to change { user.posts_counter }.by(1)
  end
end
