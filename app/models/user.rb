class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :tracks, through: :user_roles
  has_many :user_roles
  has_many :papers
  has_many :conferences
  has_many :requests
  has_many :received_requests, :class_name => 'Request', :foreign_key => 'receiver_id'
  has_many :connections
  has_many :contacts, through: :connections
end
