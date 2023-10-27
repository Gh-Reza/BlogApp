require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Reza', photo: 'photo://path', bio: 'My bio', posts_counter: 0)
  post = Post.create(author: user, title: 'Test title', text: 'Test text', comments_counter: 0, likes_counter: 0)
  subject{Like.create(user: user, post: post)}

  before{ subject.save }

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'update_likes_counter should increment likes_counter' do
    expect{subject.send(:update_likes_counter)}.to change{post.likes_counter}.by(1)
  end
end