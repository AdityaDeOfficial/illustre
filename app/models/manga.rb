class Manga < ApplicationRecord
  # belongs_to :user
  # ? might have conflict - mary
  # has_many :users, through: :bookmarks
  belongs_to :user
  has_one_attached :cover_image
  has_many :chapters
  has_many :manga_reviews

  include PgSearch::Model # Allows for mutiple word AR search

  pg_search_scope :search_by_manga_title_and_description,
    against: [ :manga_title, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
