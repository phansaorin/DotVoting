class RemoveaddressFromUser < ActiveRecord::Migration
  def change
  	remove_column :Users, :address
  end
end
