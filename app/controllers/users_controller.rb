class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # user feed
    @users = User.all
  end

  def show
    # user profile
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end
end
