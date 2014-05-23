class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @arr_suggestions = []
  	@votes = Vote.all
  	@suggestions = Round.where(:status => "vote").order("deadline ASC")
    @suggestions.each do |suggestion|
        top_answer = UserAnswer.where(:round_id => suggestion.id).group("answer_id").order("count(answer_id) desc").first
        if top_answer
          txt_answer = top_answer.answer.txt_answers
        else
          txt_answer = "N/A"
        end
        ele = {:suggestion => suggestion, :top_answer => txt_answer}
        @arr_suggestions << ele
    end
  end  

 def show
 	@arr_answers = []
 	@question_id = params[:id]
 	@round = Round.find(@question_id)

   @suggestion = Round.find_by_id(params[:id])

  	@round = Round.find(@question_id)
  	@answers = Answer.find_all_by_round_id(@question_id)
  	@answers.each do |answer|
  		amount = @voted_amount = UserAnswer.find_all_by_answer_id_and_round_id(answer.id, @question_id).count
  		tmp = {:answer => answer, :amount => amount}
  		@arr_answers << tmp
  	end

    # @voted_amount = UserAnswer.find_all_by_answer_id_and_round_id(answer.id, @question_id).count
 end

 def view_completed
    @round = Round.find_by_id(params[:id])
    # @answers = Answer.find_all_by_round_id(params[:id])
    top_answer = UserAnswer.where(:round_id => params[:id]).group("answer_id").order("count(answer_id) desc").first
    if top_answer
      @txt_answer = top_answer.answer.txt_answers
    end
 end

end
