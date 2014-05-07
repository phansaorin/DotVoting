class Round < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :user_answers
  # the default (validates on both create and update)
  validates :question, :deadline, presence: true
end
