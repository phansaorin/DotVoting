class Round < ActiveRecord::Base

  # the default (validates on both create and update)
  validates :question, :deadline, :suggestion , presence: true
end
