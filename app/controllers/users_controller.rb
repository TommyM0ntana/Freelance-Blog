class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # user feed
    @users = User.where('id != ?', current_user.id)
    @friendship = Friendship.new
  end

  def show
    # user profile
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @friendship = Friendship.new
  end
end
