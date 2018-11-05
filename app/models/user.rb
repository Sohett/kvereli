class User < ApplicationRecord
  has_one :parent
  has_one :kid
  validates :email, :encrypted_password, presence: true

  before_create :add_user_uuid


  private

  def add_user_uuid
    self.uuid = SecureRandom.uuid
  end
end
