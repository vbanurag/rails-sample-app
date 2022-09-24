require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.password=  BCrypt::Password.create(self.password)
    end
  end
  def clear_password
    self.password = nil
  end

end
