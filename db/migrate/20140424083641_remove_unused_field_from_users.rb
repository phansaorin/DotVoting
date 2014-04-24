class RemoveUnusedFieldFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :first_name
  	remove_column	:users, :last_name
  	remove_column	:users, :gender
  	remove_column	:users, :phone_num
  	remove_column	:users, :address
  end
end
