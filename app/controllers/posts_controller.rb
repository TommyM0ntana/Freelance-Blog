class PostsController < ApplicationController
  def index
  end

  def new 
    @post = Post.new
  end

  def show; end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, flash: { success: 'Post shared successfully!' }
    else
      redirect_to new_post_path, flash: { danger: 'Post was not shared' }
    end
  end

  def edit; end

  def destroy; end

  def update; end

  private

    def post_params 
      params.require(:post).permit(:title, :content)
    end
end
