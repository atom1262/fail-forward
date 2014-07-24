class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :improvements, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  delegate :industry, to: :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true

  def self.recent
    order(created_at: :desc).limit(5)
  end

  def self.by_improvement_date
    order("improved_at DESC NULLS LAST")
  end

  def user_full_name
    user.formatted_name
  end

  def industry_name
    industry.name
  end

end
