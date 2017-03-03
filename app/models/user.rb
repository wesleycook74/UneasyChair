class User < ApplicationRecord
	has_many :tracks, optional: true
end
