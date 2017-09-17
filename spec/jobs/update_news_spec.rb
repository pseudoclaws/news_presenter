require 'rails_helper'

RSpec.describe UpdateNews, type: :job do
  describe 'perform later' do
    it 'scans yandex news feed in order to create new news' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        UpdateNews.perform_later
      }.to have_enqueued_job
    end
  end
end