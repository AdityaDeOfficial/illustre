class Manga < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :chapters, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks #mary?

  include PgSearch::Model # Allows for mutiple word AR search

  pg_search_scope :search_by_manga_title_and_description,
    against: [ :manga_title, :description ],
    using: {
      tsearch: { prefix: true }
    }
end

# has_many :chapter_reviews, dependent: :destroy
# has_many :manga_reviews, dependent: :destroy
