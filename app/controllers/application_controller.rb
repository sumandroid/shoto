require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  skip_before_action :verify_authenticity_token

  def render_bad_request
    render json: {status: 400, message: 'Bad Request'}
  end

  def render_success(data = nil)
    if data.present?
      render json: {status: 200, data: data, message: 'Success'}
    else
      render json: {status: 200, message: 'Success'}
    end
  end

  def render_not_found
    render json: {status: 404, message: 'Not Found'}
  end
end
