class ImprovementsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @improvement = Improvement.new
  end

  def create
    post = Post.find(params[:post_id])
    post.improvements.create(improvement_params)
    redirect_to post
  end

  private

  def improvement_params
    params.require(:improvement).permit(:body)
  end

end
