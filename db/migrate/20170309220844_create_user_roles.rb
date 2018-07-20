class CreateUserRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_roles do |t|
      t.string :role
      t.references :user, foreign_key: true
      t.references :track, foreign_key: true

      t.timestamps
    end
  end
end
