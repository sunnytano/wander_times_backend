class Api::V1::UsersController < ApplicationController

    def index
        render json: User.all
    end

    def show
        render json: User.find(params[:id])
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: {user: user, token: encode_token(user)}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    
    private

    def user_params
        params.permit(:username, :password_digest, :email)
    end

end
