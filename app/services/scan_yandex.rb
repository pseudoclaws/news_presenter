require 'rss'

class ScanYandex
  YANDEX_MAIN_NEWS_URL = 'https://news.yandex.ru/index.rss'.freeze

  def call
    open(YANDEX_MAIN_NEWS_URL) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.first
    end
  end
end