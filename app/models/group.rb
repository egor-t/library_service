class Group < ApplicationRecord
  has_many :books
  validates :name, presence: true, length: { maximum: 255 }
end
