class Payment < ApplicationRecord
  belongs_to :reservation, optional: true
end
