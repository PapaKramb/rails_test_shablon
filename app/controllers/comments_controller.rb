class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    @posts = Post.find(params[:id])
    @c = @posts.comments.new(comments_params)
    @c.author = current_username.current_username
    @c.save
  end

  private

  def comments_params
    params.require(:comments).permit(:body)
  end
end
