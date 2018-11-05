class Parent < ApplicationRecord
  belongs_to :user
  has_many :kids

  validates :first_name, :last_name, :user_id, presence: true

end
