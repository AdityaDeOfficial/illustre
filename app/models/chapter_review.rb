class ChapterReview < ApplicationRecord
  belongs_to :user
  belongs_to :chapter

  validates :comment, presence: true
  validates :rating, presence: true
end
