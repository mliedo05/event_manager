# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :comments, as: :commentable

  enum :status, { live: 0, pending: 1, cancelled: 2 }
end
