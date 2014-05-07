class CreateTableUserAnswer < ActiveRecord::Migration
  def change
    create_table :table_user_answers do |t|
    	t.integer :user_id
        t.integer :answer_id
        t.integer :round_id	
        t.timestamps
    end
  end
end
