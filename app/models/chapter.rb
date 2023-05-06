class Chapter < ApplicationRecord
  belongs_to :manga
  has_one_attached :pdf
end
