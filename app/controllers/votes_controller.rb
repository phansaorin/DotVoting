class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
  	@votes = Vote.all
  	@rounds = Round.find_all_by_status(true)
  end  

 def show
 	@question_id = params[:id]
 	@round = Round.find(@question_id)

  	@comment = Comment.new
  	@round = Round.find(@question_id)
  	@comments = Comment.where("round_id=?", @question_id)
 end

end
