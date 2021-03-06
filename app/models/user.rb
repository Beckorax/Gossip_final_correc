class User < ApplicationRecord
  attr_accessor :remember_token
  belongs_to :city, optional: true 
  accepts_nested_attributes_for :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "Message"
  has_many :comments
  has_many :likes
  validates :email,
  presence: true,
  uniqueness: true
  has_secure_password
  validates :password,
  presence: true,
  length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
