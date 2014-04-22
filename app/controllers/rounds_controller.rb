class RoundsController < ApplicationController
  def index
  	# @rounds = Round.all
    @rounds = Round.find_all_by_status(0)
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
      @round.status = 0
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

  def status
    # debugger
    if params[:status]
      @round = Round.find_by_id(params[:id])
      @round.status = 1
      if @round.save
        redirect_to rounds_path
        flash.notice = "#{@round.question} has been enable for suggestion!"
      else
        render :index
        flash.alert = "#{@round.question} cannot enable for suggestion!"
      end
    end
   #   round = Round.find_by_id(params[:id])
   #   round.status = params[:status]
   #   round.status = true
   #   if round.save!
   #    redirect_to suggestion_path
   #   else
   #   redirect_to rounds_path
   # end
  end
  # private
  # def round_params
  #   params.require(:round).permit(:question, :suggestion, :deadline)
  # end

  def show
    @round = Round.find(params[:id])
    @round = Round.new
  end
  def destroy
    @round = Round.find_by_id(params[:id])
    @round.destroy
    redirect_to rounds_path
    flash.notice = "#{@round.question} has been deleted!"
  end
  
end
