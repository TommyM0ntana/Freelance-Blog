class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @posts = Post.all
    @post = Post.new
    timeline_posts
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post shared successfully!'
    else
      timeline_posts
      render :index, alert: 'Post was not shared'
    end
  end

  private

  def timeline_posts
    @timeline_posts ||= Post.all.ordered_by_most_recent.includes(:user)
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def retrieve_post
    @post = Post.find(params[:id])
  end
end
