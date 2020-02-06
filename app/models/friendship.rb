class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, uniqueness: { scope: :friend }
  validate :user_and_friend_are_different
end
