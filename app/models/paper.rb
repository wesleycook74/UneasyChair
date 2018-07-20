class Paper < ApplicationRecord
  belongs_to :track
  belongs_to :user
  has_many :reviews
  validates_presence_of :title, :abstract, :author, :attachment
  include NotificationsHelper
  mount_uploader :attachment, AttachmentUploader

  def automatic_accept

    if self.reviews.all.size > 2

      @average_score = self.reviews.sum(:score).to_f / self.reviews.count
      @average_confidence = self.reviews.sum(:confidence).to_f / self.reviews.count
      @owner = User.find(self.user_id)
      if @average_score > 1.4 && @average_confidence > 2
        self.update_attribute(:accepted, true)
        create_notification(@owner, 'Your paper has been accepted!', "Congratulations, your paper, #{self.title}, has been accepted")
      end
    end
  end

end
