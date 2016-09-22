class AddStatusToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :status, index: true, foreign_key: true
  end
end
