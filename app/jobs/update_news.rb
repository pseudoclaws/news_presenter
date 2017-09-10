class UpdateNews < ApplicationJob
  queue_as :default

  private

  attr_accessor :from_feed

  public

  def perform
    @from_feed = ScanYandex.new.call
    last = PieceOfNews.from_yandex.first
    return if last.present? && last.guid == from_feed.guid
    create
  end

  private

  def create
    PieceOfNews.create!(
      title: from_feed.title,
      description: from_feed.description,
      link: from_feed.link,
      guid: from_feed.guid,
      published_at: from_feed.pubDate
    )
  end
end