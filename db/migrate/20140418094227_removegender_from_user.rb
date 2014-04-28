class RemovegenderFromUser < ActiveRecord::Migration
  def change
  	remove_column :Users, :gender
  end
end
