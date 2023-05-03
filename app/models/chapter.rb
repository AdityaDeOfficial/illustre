class Chapter < ApplicationRecord
  belongs_to :manga
  has_many :chapter_reviews, dependent: :destroy
end
