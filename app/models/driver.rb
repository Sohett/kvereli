class Driver < ApplicationRecord
  has_many :journeys
  belongs_to :parent

  validates :parent_id, :driving_licence, presence: true


  private

  def default_status
    self.status = 'inactive'
  end
end
