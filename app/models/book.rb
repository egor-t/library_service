class Book < ApplicationRecord
  belongs_to :author
  validates :title, presence: true, length: { maximum: 255 }
  validates :image_url, presence: true, length: { maximum: 512 }
end
