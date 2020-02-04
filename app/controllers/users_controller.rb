class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # user feed
    @users = User.all.where('id != ?', current_user.id)
  end

  def show
    # user profile
    @user = User.find(params[:id])
  end
end
