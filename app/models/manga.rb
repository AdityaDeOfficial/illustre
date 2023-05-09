class Manga < ApplicationRecord
  # belongs_to :user
  # ? might have conflict - mary
  # has_many :users, through: :bookmarks
  has_many :users

  has_one_attached :photo
  has_many :chapters, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  include PgSearch::Model # Allows for mutiple word AR search

  pg_search_scope :search_by_manga_title_and_description,
    against: [ :manga_title, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
