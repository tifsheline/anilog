class AddBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :species, :string
  end
end
