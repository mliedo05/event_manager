# frozen_string_literal: true

# Handle responses of api controllers
module Responsable
  extend ActiveSupport::Concern

  def success_response(status, data, extra_data = {})
    message = { status: status, data: data, message: extra_data[:message] || "All clear" }

    message.merge!({ total_entries: extra_data[:total_entries] }) if extra_data[:total_entries].present?
    
    render json: message
  end

  def error_response(status, data, message)
    message = { status: status, data: data, message: message }

    render json: message, status: status
  end

  def render_forbidden_error(model)
    error_response(403, { operation_status: 'forbidden'}, "#{model} not available")
  end

  def render_not_found_error(model)
    error_response(404, { operation_status: 'not found'}, "#{model} not found")
  end
end
