require 'rails_helper'

RSpec.describe CreateAuthorized, type: :class do
  let(:news_params) { {
    title: Faker::Lorem.paragraph,
    description: Faker::Lorem.paragraph,
    published_at: Time.now,
    valid_until: 1.day.since(Time.now)
  } }

  it 'creates authorized news' do
    expect { CreateAuthorized.new(news_params).call }.to change(PieceOfNews, :count).by(1)
  end

  it 'schedules discard job' do
    expect { CreateAuthorized.new(news_params).call }.to change(DiscardAuthorized.jobs, :size).by(1)
  end
end