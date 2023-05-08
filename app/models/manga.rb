class Manga < ApplicationRecord
  # belongs_to :user
  # ? might have conflict - mary
  # has_many :users, through: :bookmarks
  has_many :users

  has_one_attached :photo
  has_many :chapters, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
