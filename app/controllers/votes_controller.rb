class VotesController < ApplicationController
  def index
  	@votes = Vote.all
  	@rounds = Round.all
  end  
  def question
 	@vote = Vote.find_by_id(params[:id])
	@round = Round.new
 end
end
