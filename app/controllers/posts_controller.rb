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

  end

  def edit

  end

  def update

  end

  def destroy

  end
  
end
