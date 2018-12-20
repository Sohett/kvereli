module Response
  extend ActiveSupport::Concern

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def not_authorized
    render json: { error: 'Not authenticated, please sign_in first on /v1/parent_sign_in?email=*&password=*' }, status: :unauthorized
  end

  def request_forbidden
    render json: { error: 'Not authorized, permission denied for the queried resource'}, status: :forbidden
  end
end
