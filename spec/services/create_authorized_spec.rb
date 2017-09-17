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
    ActiveJob::Base.queue_adapter = :test
    expect {
      CreateAuthorized.new(news_params).call
    }.to have_enqueued_job(DiscardAuthorized).at(news_params[:valid_until])
  end
end