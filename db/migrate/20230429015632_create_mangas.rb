class CreateMangas < ActiveRecord::Migration[7.0]
  def change
    create_table :mangas do |t|
      t.string :manga_title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.json :cover_image

      t.timestamps
    end
  end
end
