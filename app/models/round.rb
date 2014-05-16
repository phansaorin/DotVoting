class Round < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :user_answers
  # the default (validates on both create and update)
  validates :question, :deadline, presence: true

  def self.delete_user_answer user_id, round_id
    # Delete all records of user voted at previous time
	user_answers = UserAnswer.find_all_by_user_id_and_round_id(user_id, round_id)
  	user_answers.each do |u_answer|
  		u_answer.destroy
  	end
  end

end
