class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true, length: { maximum: 280 }
  validates :user_id, :post_id, presence: true
end
