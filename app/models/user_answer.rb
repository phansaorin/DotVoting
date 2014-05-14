class UserAnswer < ActiveRecord::Base
	belongs_to :round
	belongs_to :answer
	belongs_to :user

	def save vote_answer, user_id, round_id
        self.answer_id = vote_answer
        self.user_id = user_id
        self.round_id = round_id
        self.save!
	end

end