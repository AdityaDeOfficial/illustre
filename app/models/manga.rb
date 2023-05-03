class Manga < ApplicationRecord
  belongs_to :user
  has_one_attached :cover_image

  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks
end

# has_many :chapter_reviews, dependent: :destroy
# has_many :manga_reviews, dependent: :destroy
