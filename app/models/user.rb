class User < ApplicationRecord
  before_save :change_email_to_lowercase
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence:  true, length: { maximum: 255 }, format: { with: ENV["VALID_EMAIL_REGEX"] }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true,length: { minimum: 6 }

  def change_email_to_lowercase
    self.email = email.downcase
  end
end
