class RemovefirstNameFromUser < ActiveRecord::Migration
  def change
  	remove_column :Users, :first_name
  end
end
