class AddColumnsToConference < ActiveRecord::Migration[5.0]
  def change
    add_column :conferences, :name, :string
    add_column :conferences, :acronym, :string
  end
end
