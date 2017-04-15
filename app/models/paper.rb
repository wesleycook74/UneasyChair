class Paper < ApplicationRecord
  belongs_to :track
  belongs_to :user
  has_many :reviews
  validates_presence_of :title, :abstract, :author, :attachment
  mount_uploader :attachment, AttachmentUploader

  def automatic_accept

    if self.reviews.all.size > 2
      self.accepted = true
      @average_score = self.reviews.all.sum(:score).to_f / self.reviews.all.size
      if @average_score > 1.4
        self.accepted = true
      end
    end
  end

end
