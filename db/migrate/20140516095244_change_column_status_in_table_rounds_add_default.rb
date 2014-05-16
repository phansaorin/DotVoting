class ChangeColumnStatusInTableRoundsAddDefault < ActiveRecord::Migration
  def change
  	change_column :rounds, :status, :string, :default => "round"
  end
end
