class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = (current_user.friends.map(&:posts) + current_user.posts).flatten
    @posts = Post.all.order('created_at DESC')
    # @comments = @post.comments.includes(:user)
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.includes(:user)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post shared successfully!'
    else
      render :index, alert: 'Post was not shared'
    end
  end

  def edit
    @post = Post.find_by(id: params[:format])
    @like = Like.new
    @posts = Post.all
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def retrieve_post
    @post = Post.find(params[:id])
  end
end
