class PostsController < ApplicationController
	def new
		# @round = Round.find_by_id(params[:user_id])
		@posts = Post.new
	end
end
