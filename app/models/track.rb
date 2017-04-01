class Track < ApplicationRecord
	belongs_to :conference
	has_many :papers
	has_many :user_roles
	has_many :requests
	has_many :users, through: :user_roles
	accepts_nested_attributes_for :user_roles

	def add_user(user, role)
		self.user_roles.build(user_id: user, role: role)
	end
end
