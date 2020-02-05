class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true, length: { maximum: 280,
                                                too_long: '280 characters in comment is the maximum allowed.' }
  validates :user_id, :post_id, presence: true
end
