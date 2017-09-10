class AddGuidAndLinkToPieceOfNews < ActiveRecord::Migration[5.1]
  def change
    add_column :piece_of_news, :guid, :string
    add_column :piece_of_news, :link, :string
  end
end
