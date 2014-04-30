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
end
