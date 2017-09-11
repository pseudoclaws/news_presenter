require 'rails_helper'

RSpec.describe ScanYandex, type: :class do
  it 'creates news from yandex feed' do
    expect { ScanYandex.new.call }.to change(PieceOfNews, :count).by(1)
  end
end