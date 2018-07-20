class AddConferenceToTrack < ActiveRecord::Migration[5.0]
  def change
    add_reference :tracks, :conference, foreign_key: true
  end
end
