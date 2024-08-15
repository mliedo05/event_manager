# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  enum :status, { live: 0, pending: 1, cancelled: 2, finished: 3 }
end
