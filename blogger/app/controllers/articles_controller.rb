class ArticlesController < ApplicationController
	before_filter :require_login, except: [:index, :show]

	include ArticlesHelper

	def index
		@articles = Article.all
	end
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
	end
	def new
		@article = Article.new
	end
	def create
		article = Article.new(article_params)
		article.save

		flash.notice = "Article '#{article.title}' Created!"

		redirect_to article_path(article)
	end
	def destroy
		Article.find(params[:id]).destroy

		flash.notice = "Article Destroyed!"

		redirect_to articles_path
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		article = Article.update(params[:id], article_params)

		flash.notice = "Article '#{article.title}' Updated!"

		redirect_to article_path(article)
	end
end
