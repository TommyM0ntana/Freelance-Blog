class PostsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end

end
