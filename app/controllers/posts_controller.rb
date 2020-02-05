class PostsController < ApplicationController
  before_action :retrieve_post, except: %i[new create index]
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :required_login

  def index
    @posts = Post.all
    # @post = Post.new
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.valid?
      @post.save
      redirect_to posts_url, flash: { success: 'Post shared successfully!' }
    else
      render 'new', flash: { danger: 'Post was not shared' }
    end
  end

  def edit; end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def update
    if @post.update(params[:post][:content])
      flash[:success] = 'Post was successfully updated'
      redirect_to @post
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def retrieve_post
    @post = Post.find(params[:id])
  end
end
