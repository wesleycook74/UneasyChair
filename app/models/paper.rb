class Paper < ApplicationRecord
  belongs_to :track
  belongs_to :user
  has_many :reviews
  mount_uploader :attachment, AttachmentUploader

end
