class Conference < ApplicationRecord
	has_many :tracks
	belongs_to :user
end
