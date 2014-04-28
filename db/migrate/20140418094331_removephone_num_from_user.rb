class RemovephoneNumFromUser < ActiveRecord::Migration
  def change
  	remove_column :Users, :phone_num
  end
end
