class ChangeRebuttalToReview < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :rebuttal, :review
  end
end
