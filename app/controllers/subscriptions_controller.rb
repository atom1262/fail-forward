class SubscriptionsController < ApplicationController

  def create
    post = find_post
    current_user.subscribe(post)
  end

  def destroy
    post = find_post
    current_user.unsubscribe(post)
  end

  private

  def find_post
    Post.find(params[:id])
  end

end
