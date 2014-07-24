class User < ActiveRecord::Base
  belongs_to :industry
  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :improvements, through: :posts, dependent: :destroy

  POST_COUNT_MULTIPLIER = 1.5
  COMMENT_COUNT_MULTIPLIER = 1
  IMPROVEMENT_COUNT_MULTIPLIER = 2

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.formatted_name = auth.info.name
        user.picture_url = auth.info.image
        user.email_address = auth.info.email
        user.industry = find_industry(auth.info.industry)
        user.oauth_token = auth.credentials.token
        user.save!
    end
  end

  def signed_in?
    true
  end

  def owns?(post)
    id == post.user_id
  end

  def subscribe(post)
    subscriptions.create(post: post)
  end

  def unsubscribe(post)
    subscription = subscriptions.find_by(post: post)
    subscription.destroy
  end

  def subscribes?(post)
    subscriptions.exists?(post: post)
  end

  def knowledge_score
    post_score + comment_score + improvement_score
  end

  private

  def self.find_industry(industry)
    Industry.find_or_create_by(name: industry)
  end

  def post_score
    posts.count * POST_COUNT_MULTIPLIER
  end

  def improvement_score
    improvements.count * IMPROVEMENT_COUNT_MULTIPLIER
  end

  def comment_score
    comments.count * COMMENT_COUNT_MULTIPLIER
  end

end
