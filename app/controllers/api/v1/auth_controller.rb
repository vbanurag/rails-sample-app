class Api::V1::AuthController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    if user = User.find_by(email: user_login_params[:data][:email])
      # User found
      puts user
      if BCrypt::Password.new(user[:password]) == user_login_params[:data][:password]
        # Success!
        token = JsonWebToken.encode(user_id: user.id)
        render json: {message: "User Login Sucess!!", token: token}, status: 200
      else
        # Invalid password
        render json: {message: "User Invalid!!"}, status: 400
      end
    else
      # User not found
      render json: {message: "User Invalid!!"}, status: 400
    end
  end

  private
  def user_login_params
    params.require(:payload).permit([
                                      data:[
                                        :email,
                                        :password
                                      ]
                                    ])
  end
end
