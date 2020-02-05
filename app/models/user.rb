class User < ApplicationRecord
  before_save { self.email = email.downcase }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation for user tests
  #   validates :first_name, presence: true, length: { maximum: 50 }
  #   validates :last_name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :posts
  has_many :comments, dependent: :destroy
end
