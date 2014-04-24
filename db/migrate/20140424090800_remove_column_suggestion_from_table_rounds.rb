class RemoveColumnSuggestionFromTableRounds < ActiveRecord::Migration
  def change
  	remove_column :rounds, :suggestion
  end
end
