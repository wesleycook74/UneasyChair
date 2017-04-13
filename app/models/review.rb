class Review < ApplicationRecord
  belongs_to :paper
  belongs_to :user
  validates_presence_of :reviewer, :score, :rebuttal, :confidence
end
