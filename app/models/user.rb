# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: {minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  has_secure_password
  attr_reader :password

  has_many :goals

  has_many :user_comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :UserComment

  has_many :comments,
    primary_key: :id,
    foreign_key: :page_owner_id,
    class_name: :UserComment

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && user.is_password?(password)
    nil
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
end
