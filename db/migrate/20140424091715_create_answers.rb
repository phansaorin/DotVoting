class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :txt_answers
      t.integer :round_id		    	
      t.timestamps
    end
  end
end
