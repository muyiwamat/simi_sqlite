class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :address, :postcode
  has_secure_password
  # VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  # validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create }
  validates :password, length: { minimum: 7 }
  validates :password_confirmation, presence: true
  validates :postcode, format: { with: /\A([a-zA-Z]{2})\d{2}(\s|)\d([a-zA-Z]{2})\z/ }
  # validates :postcode, format: { with: /\A([a-zA-Z]{2})\d{2}\s\d([a-zA-Z]{2})\z/ }
end
