class Paper < ApplicationRecord
  belongs_to :track
  belongs_to :user
  has_many :reviews
  validates_presence_of :title, :abstract, :author, :attachment
  mount_uploader :attachment, AttachmentUploader

  def automatic_accept

    if self.reviews.all.size > 2

      @average_score = self.reviews.sum(:score).to_f / self.reviews.count
      @average_confidence = self.reviews.sum(:confidence).to_f / self.reviews.count
      if @average_score > 1.4 && @average_confidence > 2
        self.update_attribute(:accepted, true)
      end
    end
  end

end
