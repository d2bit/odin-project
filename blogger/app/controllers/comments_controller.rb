class CommentsController < ApplicationController
	include CommentsHelper

	def create
		c = Comment.new(comment_params)
		c.article_id = params[:article_id]
		c.save

		redirect_to article_path(c.article)
	end
end
