class Api::V1::UsersController < ApplicationController

    def index
        render json: User.all
    end

    def show
        render json: User.find(params[:id])
    end

    # def create
    #     user = User.create(user_params)
    #     if user.valid?
    #         render json: {user: user, token: encode_token(user)}
    #     else
    #         render json: {errors: user.errors.full_messages}
    #     end
    # end

     def create
        user = User.new(
        username: params[:username],
        password: params[:password],
        avatar: "https://robohash.org/#{params[:username].gsub(" ", "")}.png?size=100x100&set=set4"
        )
        if user.save

			token = encode_token(user.id)

			render json: {user: UserSerializer.new(user), token: token}
		else
			render json: {errors: user.errors.full_messages}
		end
	end


    
    private

    def user_params
        params.permit(:username, :password, :avatar)
    end

end
