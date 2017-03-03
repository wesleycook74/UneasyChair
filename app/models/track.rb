class Track < ApplicationRecord
	belongs_to :conference
	has_many :papers
	has_many :users
end
