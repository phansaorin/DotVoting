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
    if params[:suggestion_answers]
      # Delete all records of user voted at previous time
      Round.delete_user_answer current_user.id, params[:round_id]
      params[:suggestion_answers].each do |vote_answer|
        @user_answer = UserAnswer.new

        @user_answer.answer_id = vote_answer
        @user_answer.user_id = current_user.id
        @user_answer.round_id = params[:round_id]
        @user_answer.save!
      end
    else
      # Delete all records of user voted at previous time
      Round.delete_user_answer current_user.id, params[:round_id]
    end

    redirect_to vote_path(params[:round_id])
  end

end
