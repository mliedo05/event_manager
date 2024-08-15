# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :reservation, optional: true

  enum :status, { pending: 0, paid: 1, cancelled: 2 }
end
