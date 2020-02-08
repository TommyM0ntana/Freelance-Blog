class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests = current_user.friend_requests
  end

  def show
    @friendship
  end

  def create
    @friendship = current_user.friendships.build(friendship_params)
    return unless @friendship.save

    flash[:success] = 'Friend request sent'
    redirect_to users_path
  end

  def confirm
    @user = User.find_by(id: params[:format])
    current_user.confirm_friend(@user)
    flash[:success] = 'Friend Request Confirmed'
    redirect_to friends_path
  end

  def cancel
    @user = User.find_by(id: params[:format])
    current_user.cancel_friend_request(@user)
    flash[:success] = 'Friend Request Canceled'
    redirect_to friends_path
  end

  def destroy
    @user = User.find_by(user_id: params[:format])
    current_user.friends.delete(@user)
    flash[:danger] = 'Removed Friend'
    redirect_to users_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
