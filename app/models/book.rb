class Book < ApplicationRecord
  has_and_belongs_to_many :authors, uniq: true
  belongs_to :group
  validates :title, presence: true, length: { maximum: 255 }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
