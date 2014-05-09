class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @arr_suggestions = []
  	@votes = Vote.all
  	@suggestions = Round.find_all_by_status(true)
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
 	@question_id = params[:id]
 	@round = Round.find(@question_id)

  	@comment = Comment.new
  	@round = Round.find(@question_id)
  	@comments = Comment.where("round_id=?", @question_id)
 end

end
