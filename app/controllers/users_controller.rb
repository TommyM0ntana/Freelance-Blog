class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # user feed
    @users = User.where('id != ?', current_user.id)
    @pending_friends = current_user.pending_friends
    @requests = current_user.friend_requests
    @friends = current_user.friends
    @friendship = Friendship.new
  end

  def show
    # user profile
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order('created_at DESC')
    @friendship = Friendship.new
    @comment = Comment.new
    @like = Like.new
    @post = Post.new
  end
end
