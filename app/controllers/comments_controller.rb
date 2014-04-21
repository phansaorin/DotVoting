class CommentsController < ApplicationController
  def index
  	@round = Round.find(params[:round_id])
  	@comment = Comment.new
  	@comments = Comment.all
  end  

  def create
  	@round = Round.find(params[:round_id])
  	@comment = Comment.new

  	@new_comment = Comment.new
  	@new_comment.txt_comment = params[:comment][:txt_comment]
  	@new_comment.round_id = params[:round_id]
  	@new_comment.user_id = current_user.id
  	@new_comment.save!
  	#redirect_to round_comments_path(@round, @comment)
  	redirect_to vote_path(@round)
  end

end
