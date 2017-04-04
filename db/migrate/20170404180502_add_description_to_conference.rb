class AddDescriptionToConference < ActiveRecord::Migration[5.0]
  def change
    add_column :conferences, :description, :string
  end
end
