class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 8000 }
  validates :user_id, presence: true
end
