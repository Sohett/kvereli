class Kid < ApplicationRecord
  belongs_to :parent

  validates :parent, presence: true
end
