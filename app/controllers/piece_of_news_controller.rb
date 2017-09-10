class PieceOfNewsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :set_piece_of_news, only: %i[show destroy]

  def show; end

  def new
    @piece_of_news = PieceOfNews.authorized.first || PieceOfNews.new(valid_until: 1.days.since(Time.now))
  end

  def create
    @piece_of_news = CreateAuthorized.new(piece_of_news_params).call
    respond_to do |format|
      format.json { render json: @piece_of_news, status: :created }
    end
  end

  # DELETE /authorized_news/1.json
  def destroy
    @piece_of_news.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_piece_of_news
    @piece_of_news = PieceOfNews.authorized.first || PieceOfNews.from_yandex.first
    @piece_of_news ||= UpdateNews.perform_now
  end

  def piece_of_news_params
    params.require(:piece_of_news).permit(:title, :description, :valid_until, :published_at)
  end
end
