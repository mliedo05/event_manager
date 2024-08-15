# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def require_admin!
    authorize_role(:admin)
  end

  def require_provider_and_admin!
    authorize_role(:provider, :admin)
  end

  def require_client_and_admin!
    authorize_role(:client, :admin)
  end

  private

  def authorize_role(*roles)
    return if roles.any? { |role| current_user.send("#{role}?") }

    flash[:alert] = I18n.t('errors.authentication.forbidden_action')
    redirect_to root_path
  end
end
