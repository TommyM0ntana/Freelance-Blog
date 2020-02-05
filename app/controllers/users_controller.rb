class UsersController < ApplicationController
  before_action :authenticate_user!, :required_login

  def index
    # user feed
    @users = User.all
  end

  def show
    # user profile
    @user = User.find(params[:id])
  end
end
