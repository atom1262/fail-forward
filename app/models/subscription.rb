class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def self.by_improvement_date
    joins(
      <<-EOSQL
        INNER JOIN posts
        LEFT OUTER JOIN (SELECT DISTINCT ON (posts_id) * FROM improvements)
      EOSQL
    ).
      order("improvements.updated_at DESC NULLS LAST")
  end
end
