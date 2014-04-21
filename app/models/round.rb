class Round < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  # the default (validates on both create and update)
  validates :question, :deadline, :suggestion , presence: true
end
