class AddPaperIdToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :paper_id, :int
  end
end
