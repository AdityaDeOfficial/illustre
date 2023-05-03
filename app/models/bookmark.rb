class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :manga

  # validates :manga_id, uniqueness: {scope: :list_id, message: "You already booked marked it :D!"}
end
