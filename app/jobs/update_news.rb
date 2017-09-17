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
    publish
  end

  private

  def create
    @piece_of_news = PieceOfNews.create!(
      title: from_feed.title,
      description: from_feed.description,
      link: from_feed.link,
      guid: from_feed.guid,
      published_at: from_feed.pubDate
    )
  end

  def publish
    return if PieceOfNews.authorized.exists?
    ActionCable.server.broadcast('root_page', piece_of_news: @piece_of_news)
  end
end