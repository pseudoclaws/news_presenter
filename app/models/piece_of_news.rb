class PieceOfNews < ApplicationRecord
  validates :title, :description, presence: true
  validates :valid_until, presence: true, if: :authorized?

  default_scope -> { order(published_at: :desc) }
  scope :from_yandex, -> { where(authorized: false) }
  scope :authorized, -> { where('authorized = true and valid_until >= ?', Time.now) }
end
