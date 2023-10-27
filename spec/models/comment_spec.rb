require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Reza', photo: 'photo://path', bio: 'My bio', posts_counter: 0)
  post = Post.create(author: user, title: 'Test title', text: 'Test text', comments_counter: 0, likes_counter: 0)
  subject{Comment.create(user: user, post: post, text: 'Test text')}

  before{ subject.save }
  
  it 'update_comments_counter should increment comments_counter' do
    expect{subject.send(:update_comments_counter)}.to change{post.comments_counter}.by(1)
  end
end