class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: { maximum: 255 }
end
