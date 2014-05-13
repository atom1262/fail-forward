class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :body, presence: true
  validates :user, presence: true

  COMMENTS_PER_PAGE = 3

  def self.recent
    order(created_at: :desc)
  end

  def self.paginated(page)
    recent.page(page).per(COMMENTS_PER_PAGE)
  end

end
