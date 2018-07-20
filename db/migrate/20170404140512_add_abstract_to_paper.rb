class AddAbstractToPaper < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :abstract, :string
  end
end
