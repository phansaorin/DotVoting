class CreateTableComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :txt_comment
    	t.integer :round_id
    	t.integer :user_id

    	t.timestamps
    end
  end
end
