class AddUsersToConference < ActiveRecord::Migration[5.0]
  def change
    add_reference :conferences, :user, foreign_key: true
  end
end
