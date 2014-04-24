class SuggestionsController < ApplicationController
  def index
	# @suggestion = Round.where(:status => true)
	@suggestions = Round.find_all_by_status(1)
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
