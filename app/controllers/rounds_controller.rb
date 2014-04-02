class RoundsController < ApplicationController
  def index
  	@rounds = Round.all
  end

  def new
  	@round = Round.new
  end

  def create
  	  @round = Round.new
      @round.id = params[:round][:id]
      @round.question = params[:round][:question]
      @round.suggestion = params[:round][:suggestion]
      @round.deadline = params[:round][:deadline]
      @round.save
	   redirect_to rounds_path
  end
  def edit
    @round = Round.find_by_id(params[:id])
    # add_breadcrumb "Home", users_path
    # add_breadcrumb "Edit User"
  end
  def update
      @round = Round.find_by_id(params[:id])
      @round.question = params[:round][:question]
      @round.suggestion = params[:round][:suggestion]
      @round.deadline = params[:round][:deadline]
    if @round.save
      redirect_to rounds_path
      flash.notice = "#{@round.question} has been updated!"
    else 
      render :edit
      flash.alert = "Update failed! Please try again!"
    end
  end
  # private
  # def round_params
  #   params.require(:round).permit(:question, :suggestion, :deadline)
  # end

  def show
    @round = Round.find(params[:id])
  end
  def destroy
    @round = Round.find_by_id(params[:id])
    @round.destroy
    redirect_to rounds_path
    flash.notice = "#{@round.question} has been deleted!"
  end
  
end
