class IndustriesController < ApplicationController

  def show
    @industry = Industry.find(params[:id])
    @posts = @industry.posts
  end

  def index
    @industries = Industry.all
  end

  private

  def industry_params
    params.require(:industries).permit(:name)
  end

end
