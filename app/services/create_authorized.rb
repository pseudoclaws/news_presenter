class CreateAuthorized
  private

  attr_reader :params

  public

  def initialize(params)
    @params = params
  end

  def call
    piece_of_news = PieceOfNews.create!(params.merge(authorized: true))
    DiscardAuthorized
      .set(wait_until: piece_of_news.valid_until)
      .perform_later(piece_of_news)
    ActionCable.server.broadcast('root_page', piece_of_news)
    piece_of_news
  end
end