class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.all
    @user_posts = current_user.posts
    @recent_posts = Post.all.recent
    @industry_posts = current_user.industry.posts
    subscribed_post_ids = current_user.subscriptions.pluck(:post_id)
    @subscribed_posts = Post.where(id: subscribed_post_ids).by_improvement_date
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    respond_with @post
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.paginated(params[:page])
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
    redirect_to user_path(current_user)
  end

  private

  def find_post
    current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
