class RoundsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rounds = Round.find_all_by_status(false)
  end

  def new
  	@round = Round.new
    @date = Date.today + 3.days
  end

  def create
      @round = Round.new
      @answer = Answer.new 
      @round.id = params[:round][:id]
      @round.question = params[:round][:question]
      @round.deadline = params[:round][:deadline]
      if @round.save
        if params[:answers]
          params[:answers].each do |each_answer|
            @answer = Answer.new
            @answer.txt_answers = each_answer
            @answer.round_id = @round.id
            @answer.top_answer = 0
            @answer.save!
          end
        end
        redirect_to rounds_path
      else 
        render :new
        flash.alert = "Cannot add new round!"
      end
  end

  def add_more_answer

    #debugger

      @more_answer = Answer.new
      @new_answer.round_id = params[:round][:id]
      @new_answer.question = params[:round][:question]
      @new_answer.save
      redirect_to rounds_path

  end

  def edit
    @round = Round.find_by_id(params[:id])
  end

  def update
      @round = Round.find_by_id(params[:id])
      @round.question = params[:round][:question]
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
    if params[:status]
      @round = Round.find_by_id(params[:id])
      @round.status = true
      if @round.save
        redirect_to rounds_path
        flash.notice = "#{@round.question} has been enable for suggestion!"
      else
        render :index
        flash.alert = "#{@round.question} cannot enable for suggestion!"
      end
    end
  end

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
