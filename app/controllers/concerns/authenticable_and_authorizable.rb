# frozen_string_literal: true

# Handle authorizartion and authentication of api controllers
module AuthenticableAndAuthorizable
  extend ActiveSupport::Concern

  # Authenticate user.
  def current_user
    @current_user ||= session_user || http_authorization_user || access_token_user
  end

  def authenticate!
    unauthorized_response unless current_user
  end

  def session_user
    return unless session.present? && session['warden.user.user.key'].present? && session['warden.user.user.key'][0].present?
    
    User.find_by_id(session['warden.user.user.key'][0][0])
  end

  def http_authorization_user
    return unless request.headers['HTTP_AUTHORIZATION'].present?

    User.where(authentication_token: request.headers['HTTP_AUTHORIZATION']&.split(' ')&.last).last
  end

  def access_token_user
    User.where(authentication_token: request.headers['Access-Token']).last if request.headers['Access-Token'].present?
  end

  def unauthorized_response
    render json: { status: 401, data: { operation_status: 'Autorización de usuario fallido' }}
  end

  def forbidden_error
    render json: {
      operation_status: 'Error', message: 'Acción no permitida'
    }, status: 403
  end
end
