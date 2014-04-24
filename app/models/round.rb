class Round < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  # the default (validates on both create and update)
  validates :question, :deadline, presence: true
end
