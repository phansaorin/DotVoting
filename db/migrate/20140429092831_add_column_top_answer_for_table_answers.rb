class AddColumnTopAnswerForTableAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :top_answer, :int
  end
end
