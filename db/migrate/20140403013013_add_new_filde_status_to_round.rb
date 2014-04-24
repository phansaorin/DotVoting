class AddNewFildeStatusToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :status, :int
  end
end
