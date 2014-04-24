class ChangeColumnStatusInTableRoundToBoolean < ActiveRecord::Migration
  def change
  	change_column :rounds, :status, :boolean, :default => false
  end
end
