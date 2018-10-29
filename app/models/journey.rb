class Journey < ApplicationRecord
  belongs_to :parent
  belongs_to :kid
  belongs_to :activity
end
