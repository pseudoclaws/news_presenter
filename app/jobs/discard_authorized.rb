class DiscardAuthorized < ApplicationJob
  queue_as :default

  def perform
    ActionCable.server.broadcast('root_page', PieceOfNews.from_yandex.first)
  end
end