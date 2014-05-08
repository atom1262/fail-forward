class ImprovementsController < ApplicationController
  respond_to :html

  def new
    @post = Post.find(params[:post_id])
    @improvement = Improvement.new
  end

  def create
    @post = Post.find(params[:post_id])
    @improvement = @post.improvements.create(improvement_params)
    respond_with @improvement, location: @post
  end

  private

  def improvement_params
    params.require(:improvement).permit(:body)
  end

end
