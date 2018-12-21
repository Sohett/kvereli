class Journey < ApplicationRecord
  belongs_to :activity
  belongs_to :driver
  has_many :kids

  validates :activity_id, :pickup_time, :pick_up_address, :destination_address, presence: true
end
