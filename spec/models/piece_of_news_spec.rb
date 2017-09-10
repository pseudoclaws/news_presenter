require 'rails_helper'

RSpec.describe PieceOfNews, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { expect(PieceOfNews.new(authorized: true)).to validate_presence_of(:valid_until)}
end
