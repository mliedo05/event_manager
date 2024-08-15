# frozen_string_literal: true

module Api
  module V1
    class ApiController < ApplicationController
      respond_to :json
      helper_method :current_user
      skip_before_action :verify_authenticity_token
      include AuthenticableAndAuthorizable
      include Responsable
    end
  end
end
