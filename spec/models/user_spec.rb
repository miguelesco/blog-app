require 'rails_helper'

RSpec.describe User, type: :model do 

  subject { User.new(name: 'Miguel', photo: 'sasa.jpg', bio: 'hello im miguel') }

  before { subject.save }

  it 'Should validate presence of name' do 
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should validate numberic of posts_counter' do 
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'Returns the last three posts for that user' do
    user = User.first
    expect(user.tree_more_recent_posts.count).to eq(3)
  end

end