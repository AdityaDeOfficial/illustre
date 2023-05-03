class Manga < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :chapters, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks #mary?
end

# has_many :chapter_reviews, dependent: :destroy
# has_many :manga_reviews, dependent: :destroy
