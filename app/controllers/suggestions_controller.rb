class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  def index
  	# @suggestion = Round.where(:status => true)
    @arr_suggestions = []
  	@suggestions = Round.find_all_by_status(true)
  
    @suggestions.each do |suggestion|
        top_answer = UserAnswer.where(:round_id => suggestion.id).group("answer_id").order("count(answer_id) desc").first
        if top_answer
          show_answer = top_answer.answer.txt_answers
        else
          show_answer = "N/A"
        end
        ele = {:suggestion => suggestion, :top_answer => show_answer}
        @arr_suggestions << ele
    end
  end

  def show

    @suggestion = Round.new
  end

  def edit
    @suggestion = Round.find_by_id(params[:id])
    @date = Date.today + 3.days 
  end

  def update
  end

  def add
    @round = Round.find_by_id(params[:id])
    @round.question = params[:round][:question]
    @round.deadline = params[:round][:deadline]

    if params[:answers]
      params[:answers].each do |each_answer|
        @answer = Answer.new
        @answer.txt_answers = each_answer
        @answer.round_id = @round.id
        @answer.top_answer = 0
        @answer.save!
      end
    end
    redirect_to suggestions_path
    flash.notice = "New suggestion has been added!"
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
        @user_answer.save vote_answer, current_user.id, params[:round_id]
      end
    else
      # Delete all records of user voted at previous time
      Round.delete_user_answer current_user.id, params[:round_id]
    end


    if params[:answers]
      params[:answers].each do |an|
        @answer = Answer.new
        @answer.txt_answers = an
        @answer.round_id = params[:round_id]
        if @answer.save
           @user_answer = UserAnswer.new

           @user_answer.save Answer.last.id, current_user.id, params[:round_id]
        end
      end
    end

    redirect_to vote_path(params[:round_id])
  end

end
