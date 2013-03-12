class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :address, :postcode, :role
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create }
  validates :password, length: { minimum: 7 }
  validates :password_confirmation, presence: true
  validates :postcode, format: { with: /\A([a-zA-Z]{2})\d{2}(\s|)\d([a-zA-Z]{2})\z/ }
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
