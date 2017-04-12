class Review < ApplicationRecord
  belongs_to :paper
  validates_presence_of :reviewer, :score, :rebuttal, :confidence
end
