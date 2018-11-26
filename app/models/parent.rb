class Parent < ApplicationRecord
  has_many :kids
  validates :email, uniqueness: { case_sensitive: false, message: 'An account for this specific email address already exists' }, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email address' }
  validates :password_digest, presence: true
  before_create :default_status
  has_secure_password


  private

  def default_status
    self.status = 'active'
  end

end
