# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  validates :title, :start_time, presence: true
  validate :start_time_must_be_today_or_in_the_future
  validate :end_time_must_be_after_start_time
  
  enum :status, { live: 0, pending: 1, cancelled: 2, finished: 3 }

  private

  def start_time_must_be_today_or_in_the_future
    return if start_time.blank?

    return unless start_time.to_date < Date.current

    errors.add(:start_time, I18n.t('errors.models.event.attributes.start_time.must_be_today_or_in_the_future'))
  end

  def end_time_must_be_after_start_time
    return if end_time.blank? || start_time.blank?

    return unless end_time < start_time

    errors.add(:end_time, I18n.t('errors.models.event.attributes.end_time.must_be_after_start_time'))
  end
end
