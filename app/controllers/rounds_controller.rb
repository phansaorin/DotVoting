class RoundsController < ApplicationController
  def index
  	 @rounds = Round.all
  end
  def new
  	
  end
  def create
  	  @round = Round.new
      @round.id = params[:round][:id]
      @round.question = params[:round][:question]
      @round.suggestion = params[:round][:suggestion]
      @round.deadline = params[:round][:deadline]
      @round.save
	   redirect_to @round
  end
  # private
  # def round_params
  #   params.require(:round).permit(:question, :suggestion, :deadline)
  # end
  def show
  @rounds = Round.find(params[:id])
  end
end
