class AdminUser < ApplicationRecord
  ROLES = %w[admin group author].freeze

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
