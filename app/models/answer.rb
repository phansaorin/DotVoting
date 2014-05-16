class Answer < ActiveRecord::Base
	belongs_to :round
	has_many :user_answers


end