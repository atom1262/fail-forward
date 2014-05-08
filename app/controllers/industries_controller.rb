class IndustriesController < ApplicationController

  def show
    @industry = Industry.find(params[:id])
    @posts = @industry.posts
  end

end
