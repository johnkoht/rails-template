module JsonResponseHelper
  extend ActiveSupport::Concern

  private

  def render_json_success
    render json: { }, status: 200
  end

  def render_json_bad_request(message)
    render json: { errors: { message: message, code: 'badrequest' } }, status: 400
  end

  def render_json_unauthorized(message)
    render json: { errors: { message: message, code: 'unauthorized' } }, status: 401
  end

  def render_json_forbidden(message)
    render json: { errors: { message: message, code: 'forbidden' } }, status: 403
  end

  def render_json_request_failed(message)
    render json: { errors: { message: message, code: 'unauthorized' } }, status: 402
  end

  def render_json_not_found(message)
    render json: { errors: { message: message, code: 'notfound' } }, status: 404
  end
end
