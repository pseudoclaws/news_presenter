namespace :np do
  namespace :testing do
    task :discard => :environment do
      return unless Rails.env == 'development'
      DiscardAuthorized.perform_now
    end
  end
end