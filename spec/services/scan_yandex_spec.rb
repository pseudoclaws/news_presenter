require 'rails_helper'

RSpec.describe ScanYandex, type: :class do
  it 'creates news from yandex feed' do
    stub_request(:get, "https://news.yandex.ru/index.rss")
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        })
      .to_return(
        status: 200,
        body: File.read(Rails.root.join('spec', 'services', 'yandex_feed_stub.xml')),
        headers: {}
      )
    expect { ScanYandex.new.call }.to change(PieceOfNews, :count).by(0)
  end
end