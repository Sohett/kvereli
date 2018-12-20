class Activity < ApplicationRecord
  belongs_to :kid

  has_many :journeys
  validates :kid, :activity_name, :description, presence: true
end
