class PostsController < ApplicationController

  def index
    @user_posts = current_user.posts
    @recent_posts = Post.all.recent
    @industry_posts = current_user.industry.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to (@post)
  end

  def show
    @post = find_post
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    @improvements = @post.improvements.order(created_at: :asc)
  end

  def edit
    @post = find_post
  end

  def update
    @post = find_post

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    post = find_post
    post.destroy
    redirect_to posts_path
  end

  private

  def find_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
