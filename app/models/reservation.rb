class Reservation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :comments, as: :commentable
end
