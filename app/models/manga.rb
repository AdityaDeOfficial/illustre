class Manga < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :chapters, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
