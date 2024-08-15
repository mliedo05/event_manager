# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :comments, as: :commentable
end
