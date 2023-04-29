class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.references :manga, null: false, foreign_key: true
      t.string :chapter_title
      t.integer :chapter_number
      t.json :pdf_upload

      t.timestamps
    end
  end
end
