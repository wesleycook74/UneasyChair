class Track < ApplicationRecord
	belongs_to :conference
	has_many :papers
	has_many :user_roles
	has_many :users, through: :user_roles

	def add_user(user, role)
		self.user_roles.build(user_id: user, role: role)
	end
end
