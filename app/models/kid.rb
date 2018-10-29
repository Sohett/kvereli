class Kid < ApplicationRecord
  belongs_to :user
  belongs_to :parent

  has_many :parents
end
