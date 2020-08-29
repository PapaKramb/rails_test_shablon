class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    @posts = Post.find(params[:post_id])
    @c = @posts.comments.new(comments_params)
    @c.author = current_user.username
    @c.save

    redirect_to post_path(@posts)
  end

  private

  def comments_params
    params.require(:comment).permit(:author, :body)
  end
end
