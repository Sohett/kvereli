class Kid < ApplicationRecord
  belongs_to :parent
  has_many :activities

  validates_uniqueness_of :first_name, scope: [:last_name, :parent_id]
  validates :parent, :first_name, :last_name, :birthdate, presence: true
end
