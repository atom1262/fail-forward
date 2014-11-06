class Comment < ActiveRecord::Base

  COMMENTS_PER_PAGE = 3

  belongs_to :user
  belongs_to :post

  validates :body, presence: true
  validates :user, presence: true

  def self.recent
    order(created_at: :desc)
  end

  def self.paginated(page)
    recent.page(page).per(COMMENTS_PER_PAGE)
  end

  def first_name
    user.first_name
  end

  def user_image
    user.picture_url
  end

end
