class CreateMangaReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :manga_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :manga, null: false, foreign_key: true
      t.float :rating
      t.string :comment

      t.timestamps
    end
  end
end
