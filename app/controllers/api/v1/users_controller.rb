require 'bcrypt'

class Api::V1::UsersController < ApplicationController
  include BCrypt

  before_action :authorize_request, except: :signup

  def show
    user = User.select(:name, :email, :username,).find_by(id: params[:id])
    if user
      render json: {user: user, message: "Fetched Successfully!!"}, status: 200
    else
      render json: {message: "No Found"}
    end
  end

  def signup
    user = User.new({
                      name: user_params[:data][:name],
                      username: user_params[:data][:name],
                      email: user_params[:data][:email],
                      password: user_params[:data][:password]
                    })
    if user.save
      render json: {message: "User registered Sucess!!"}, status: 200
    else
      render json: {message: "Failed"}
    end
  end

  private
    def user_params
      params.require(:payload).permit([
                                        data: [
                                          :name,
                                          :email,
                                          :password

                                        ]])
    end

end
