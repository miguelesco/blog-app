require 'rails_helper'

RSpec.describe Post, type: :model do
  
  subject { Post.new(author_id: 1, text: 'test test', title: 'post test') }

  before { subject.save }

  it 'Validates title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'Validates comments_counter' do
    subject.comments_counter = nil
    expect(subject).not_to be_valid
  end

  it 'Gets a post last comments' do
    
    post = Post.last
    expect(post.more_recent_comments.count).to eq(post.comments.count)

  end
end