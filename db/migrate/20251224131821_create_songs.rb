class CreateSongs < ActiveRecord::Migration[8.1]
  def change
    create_table :songs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :artist
      t.string :spotify_url

      t.timestamps
    end
  end
end
