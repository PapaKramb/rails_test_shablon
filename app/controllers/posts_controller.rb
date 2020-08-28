class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def index
    @posts = Post.order('created_at DESC')
    render action: 'index'
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new
  
  end

  def create
    @posts = current_user.posts.new(posts_params)
    if @posts.save
      redirect_to @posts
    else
      render action: 'new'
    end
  end

  def edit
    @posts = Post.find(params[:id])
  end

  def update
    @posts = Post.find(params[:id])
    if @posts.update
      redirect_to @posts
    else
      render action 'edit'
    end
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to post_path
  end

  private

  def posts_params
    params.require(:posts).permit(:title, :body)
  end
  
end
