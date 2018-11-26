class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Response
  include ExceptionHandler
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized


  private

  def current_parent
    @current_parent ||= Parent.find(payload['parent_id'])
  end

  def current_kid
    @current_parent ||= Kid.find(payload['kid_id'])
  end

  def not_authorized
    render json: { error: 'Not authorized, please sign_in first on /v1/parent_sign_in?email=*&password=*' }, status: :unauthorized
  end
end
