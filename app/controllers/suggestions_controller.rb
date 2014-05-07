class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  def index
  	# @suggestion = Round.where(:status => true)
  	@suggestions = Round.find_all_by_status(true)
    # Answer.find(:first, :conditions => ["round_id = ? ", @suggestions.id], :order => 'top_answer DESC')
  end
  def show
    @suggestion = Round.new
  end
  def status
     round = Round.find_by_id(params[:id])
     round.status = params[:status]
    if round.status == true 
     redirect_to rounds_path
     round.save!
    end
  end

  def save_voting

    params[:suggestion_answers].each do |vote_answer|
      @user_answer = UserAnswer.new
      @user_answer.answer_id = vote_answer
      @user_answer.user_id = current_user.id
      @user_answer.round_id = params[:round_id]
      @user_answer.save!
    end
    redirect_to vote_path(params[:round_id])
    

    @get_question = params[:round_id]
    @get_answer = params["suggestions"]["answers"]


  end
end
