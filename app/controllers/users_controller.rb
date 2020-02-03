class UsersController < ApplicationController
  def index
    @users = New.all
  end

  def show
    @user = User.find(params)
  end

  Private

  def users_params
    params.require(:user).permit(:email)
  end
end