class FollowsController < ApplicationController

  def create
    post = find_post
    current_user.follow(post)
  end

  def destroy
    post = find_post
    current_user.unfollow(post)
  end

  private

  def find_post
    Post.find(params[:id])
  end

end
