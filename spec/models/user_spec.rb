require 'rails_helper'

RSpec.describe User, type: :model do 

  subject { User.new(name: 'Miguel', photo: 'sasa.jpg', bio: 'hello im miguel') }

  before { subject.save }

  it 'Should validate presence of name' do 
    subject.name = nil
    expect(subject).to_not be_valid
  end

end