class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
  	@votes = Vote.all
  	@rounds = Round.find_all_by_status(true)
  end  

 def show
 	@arr_answers = []
 	@question_id = params[:id]
 	@round = Round.find(@question_id)

  	@comment = Comment.new
  	@round = Round.find(@question_id)
  	@comments = Comment.where("round_id=?", @question_id)
  	@answers = Answer.find_all_by_round_id(@question_id)
  	@answers.each do |answer|
  		amount = @voted_amount = UserAnswer.find_all_by_answer_id_and_round_id(answer.id, @question_id).count
  		tmp = {:answer => answer, :amount => amount}
  		@arr_answers << tmp
  	end

    # @voted_amount = UserAnswer.find_all_by_answer_id_and_round_id(answer.id, @question_id).count
 end

end
