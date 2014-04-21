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
  	@round = Round.find(params[:id])
 end
end
