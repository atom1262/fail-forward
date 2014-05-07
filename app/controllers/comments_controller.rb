class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    post.comments.create(comment_params)
    redirect_to post
  end

  def show
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

end
