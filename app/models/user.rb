# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, presence: true
  validate :password_complexity
  validate :username_cannot_be_blank_or_spaces
  
  enum :role, { client: 0, provider: 1, admin: 2 }

  private

  def name_cannot_be_blank_or_spaces
    if name.present? && name.strip.empty?
      errors.add(:name, I18n.t('errors.models.event.attributes.name.blank'))
    end
  end

  def password_complexity
    return if password.blank?

    unless password.match?(/^(?=.*[a-zA-Z])(?=.*\d)/) && password.match?(/[A-Z]/)
      errors.add :password, I18n.t('errors.models.event.attributes.password.complexity')
    end
  end
end
