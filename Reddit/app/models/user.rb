# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { allow_nil: true, minimum: 6 }

  attr_reader :password

  after_initialize :ensure_session_token

  has_many :subs, foreign_key: :moderator, class_name: :Sub
  has_many :posts
  has_many :comments, foreign_key: :author, class_name: :Comment

  def self.find_by_creds(username, password)
    user = User.find_by(username: username)
    user && user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end
end