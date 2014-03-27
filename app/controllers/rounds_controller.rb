class RoundsController < ApplicationController
  def index
  	# @rounds = Round.all
  end
  def new
  	
  end
  def create
  	  @round = Round.new(params[:round])
	  @round.save
	  redirect_to @round
  end
  private
  def round_params
    params.require(:round).permit(:question, :suggestion, :deadline)
  end
  def show
  @round = Round.find(params[:id])
  end
end
