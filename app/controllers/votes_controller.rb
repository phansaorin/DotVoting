class VotesController < ApplicationController
  def index
  	@votes = Vote.all
  	@rounds = Round.all
  end  
  # def question
  	# @question_id = params[:id]
 	# @vote = Vote.find_by_id(params[:id])
	# @round = Round.new
 # end
 def show
 	@question_id = params[:id]
 	@round = Round.find(@question_id)
  	@comment = Comment.new
  	@round = Round.find(@question_id)
  	@comments = Comment.where("round_id=?", @question_id)#.find_by(round_id: @question_id)
 end
end
