class ChangerebuttleToReview < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :rebuttle, :review
  end
end
