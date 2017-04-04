class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :track


  # has_many :requests
end
