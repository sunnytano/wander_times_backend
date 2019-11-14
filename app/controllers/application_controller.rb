# class ApplicationController < ActionController::API

# def encode_token(payload)
#     # don't forget to hide your secret in an environment variable
#     JWT.encode(payload, 'secret_secret')
#   end

#   def auth_header
#   # { Authorization: 'Bearer <token>' }
#     request.headers['Authorization']
#   end

#   def decoded_token
#     if auth_header
#       token = auth_header
#       # header: { 'Authorization': 'Bearer <token>' }
#       begin
#         JWT.decode(token, 'secret_secret', true, algorithm: 'HS256')
#       rescue JWT::DecodeError
#         nil
#       end
#     end
#   end

#   def current_user
#     if decoded_token
#       user_id = decoded_token[0]['user_id']
#       @user = User.find_by(id: user_id)
#     end
#   end

#   def logged_in?
#     !!current_user
#   end

#   def authorized
#     render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
#   end
# end


# # class ApplicationController < ActionController::API

# #     def secret
# #         'GloriousPegasus'
# #     end

# #     def token
# #         request.headers['Authorization'].to_s.split(' ')[1].to_s
# #     end

# #     def encode_token(user)
# #         payload = {user_id: user.id}
# #         JWT.encode(payload, secret, 'HS256')
# #     end

# #     def decoded_token
# #         JWT.decode(token, secret, true, {algorithm: 'HS256'})
# #     end

# #     def current_user
# #         user_id = decoded_token[0]['user_id']
# #         User.find(user_id)
# #     end

# # end
class ApplicationController < ActionController::API


  def encode_token(user_id)
    JWT.encode({user_id: user_id}, "beefysteak")
  end
  
  def get_auth_headers
    request.headers["Authorization"]
  end

  def decode_token
    begin
      JWT.decode(get_auth_headers, "beefysteak")[0]["user_id"]
    rescue
      nil
    end
  end

  def session_user
    User.find_by(id: decode_token)
  end
end
