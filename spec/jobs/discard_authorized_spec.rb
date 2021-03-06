require 'rails_helper'

RSpec.describe DiscardAuthorized, type: :job do
  describe '#perform_later' do
    let(:piece_of_news) { FactoryGirl.create(:authorized_piece_of_news) }
    it 'discards authorized news' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        DiscardAuthorized.perform_later(piece_of_news)
      }.to have_enqueued_job.with(piece_of_news)
    end
  end
end