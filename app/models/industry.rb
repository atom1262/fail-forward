class Industry < ActiveRecord::Base
  has_many :users
  has_many :posts, through: :users
end
