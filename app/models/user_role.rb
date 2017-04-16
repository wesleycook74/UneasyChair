class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :track
  SELECTABLE_ROLE_TYPES = ["Track Chair", "Track Member", "Author"].freeze
  ROLE_TYPES = ["Chair", "Track Chair", "Track Member", "Author"].freeze

  # has_many :requests

end
