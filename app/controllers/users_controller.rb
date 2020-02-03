class UsersController < ApplicationController
  def index
    @users = New.all
  end

  def show
    @user = User.find(:user_id)
  end
end
