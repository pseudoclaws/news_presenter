class CreatePieceOfNews < ActiveRecord::Migration[5.1]
  def change
    create_table :piece_of_news do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.datetime :published_at, null: false
      t.boolean :authorized, null: false, default: false
      t.datetime :valid_until

      t.timestamps
    end
  end
end
