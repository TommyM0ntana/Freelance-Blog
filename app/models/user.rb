class User < ApplicationRecord
  before_save { self.email = email.downcase }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         include Gravtastic
         gravtastic
  # Validation for user tests
  #   validates :first_name, presence: true, length: { maximum: 50 }
  #   validates :last_name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.status }
    friends_array += inverse_friendships.map { |friendship| friendship.user if friendship.status }
    friends_array.compact
  end

  # Users who have yet to confirme friend requests
  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.status }.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.status }.compact
  end

  def cancel_friend_request(user)
    friendship = friendships.find { |f| f.friend_id == user.id }
    friendship.destroy
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find { |f| f.user == user }
    friendship.status = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end
end
