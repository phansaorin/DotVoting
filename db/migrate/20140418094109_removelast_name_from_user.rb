class RemovelastNameFromUser < ActiveRecord::Migration
  def change
  	remove_column :Users, :last_name
  end
end
