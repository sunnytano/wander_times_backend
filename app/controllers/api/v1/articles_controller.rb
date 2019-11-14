class Api::V1::ArticlesController < ApplicationController

    def index
        @articles = Article.all
        render json: @articles
    end 

    def show 
        @article = Article.find(params[:id])
        render json: @article
    end 

    def create
        @article = Article.create(article_params)
        render json: @article
    end 

    private

    def article_params
        params.require(:article).permit(:title, :author, :overview, :url, :image, :category, :content)
    end 


end
