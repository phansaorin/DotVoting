class RemoveGenderPhoneLastnameFromUsersTable < ActiveRecord::Migration
  def change
  	remove_column :Users, :last_name
  	remove_column :Users, :phone_num
  	remove_column :Users, :gender
  end
end
