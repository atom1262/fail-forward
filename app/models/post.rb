class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  delegate :industry, to: :user

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
end
