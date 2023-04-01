require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Harshita', photo: 'my_photo', bio: 'my_bio', posts_counter: 0)

  before { user.save }

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end
end
