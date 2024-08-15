# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def only_admin!
    redirect_to root_path unless current_user.admin?
    flash[:alert] = 'No tienes permitido realizar esta acción'
  end
end
