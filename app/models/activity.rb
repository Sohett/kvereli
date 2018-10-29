class Activity < ApplicationRecord
  belongs_to :kid

  has_many :journeys
end
