class PaperRefTrack < ActiveRecord::Migration[5.0]
  def change
    add_reference :papers , :track , foreign_key: true
  end
end
