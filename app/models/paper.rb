class Paper < ApplicationRecord
  has_many :reviews
  mount_uploader :attachment, AttachmentUploader

end
