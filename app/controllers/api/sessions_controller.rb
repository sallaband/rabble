class Api::SessionsController < ApplicationController

  wrap_parameters include: [:name, :password]

  def create
    @user = User.find_by_credentials(user_params[:name], user_params[:password])
    if @user
      log_in!(@user)
      render json: @user
    else
      render json: ["Invalid Credentials"], status: 422
    end
  end

  def destroy
    log_out!
    render json: "success"
  end

  def new
    @user = User.new
  end

  private 
  def user_params
    params.require(:session).permit(:name, :password)
  end

end