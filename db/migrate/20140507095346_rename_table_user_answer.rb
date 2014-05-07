class RenameTableUserAnswer < ActiveRecord::Migration
  def change
        rename_table :table_user_answers, :user_answers
  end 
end
