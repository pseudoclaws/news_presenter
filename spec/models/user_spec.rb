require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without email' do
    user = FactoryGirl.build(:user, password: Faker::Internet.password, email: nil)
    expect(user.valid?).to eq false
  end

  it 'is invalid without password' do
    user = FactoryGirl.build(:user, password: nil, email: Faker::Internet.email)
    expect(user.valid?).to eq false
  end
end
