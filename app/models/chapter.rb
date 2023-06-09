class Chapter < ApplicationRecord
  belongs_to :manga
  has_one_attached :pdf
  has_many :chapter_reviews, dependent: :destroy
end
