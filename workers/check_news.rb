require 'sidekiq-scheduler'

class CheckNewsWorker
  include Sidekiq::Worker

  def perform(*args)
    UpdateNews.perform_now
  end
end