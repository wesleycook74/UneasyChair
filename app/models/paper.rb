class Paper < ApplicationRecord
  belongs_to :track
  belongs_to :user
  has_many :reviews
  validates_presence_of :title, :abstract, :author, :attachment
  mount_uploader :attachment, AttachmentUploader



end
