class AlterTableUsers < ActiveRecord::Migration
  def up
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :gender, :string
  	add_column :users, :phone_num, :integer
  	add_column :users, :address, :string

  end
end
