class User < ActiveRecord::Base
  belongs_to :industry
  has_many :posts, dependent: :destroy
  has_many :follows

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

  def follow(post)
    follows.create(post: post)
  end

  def unfollow(post)
    follow = follows.find_by(post: post)
    follow.destroy
  end

  def follows?(post)
    follows.exists?(post:post)
  end

  private

  def self.find_industry(industry)
    Industry.find_or_create_by(name: industry)
  end

end
