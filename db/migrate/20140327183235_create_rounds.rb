class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :question
      t.string :suggestion
      t.date :deadline

      t.timestamps
    end
  end
end
