class Api::V1::LikesController < ApplicationController

def index 
    @likes = Like.all 
    render json: @likes
end

def show 
    @like = Like.find(params[:id])
    render json: @like
end 

def create
    @like=Like.create(like_params)
    render json: @like
end 

def destroy 
    @like = Like.find(params[:id])
    @like.destroy
end 

private

def like_params
    params.require(:like).permit(:user_id, :article_id)
end 


end
