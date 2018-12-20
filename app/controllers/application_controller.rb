class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Response
  include ExceptionHandler
  include JWTSessions::RailsAuthorization
  include VerifyAuthorisationForRequestedResource
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized


  private

  def current_parent
    @current_parent ||= Parent.find(payload['parent_id'])
  end

  # When the sign_up & login logic will be implemented for the kid as well, I will have a current_kid as well. Not a current user
  # def current_kid
  #   @current_parent ||= Kid.find(payload['kid_id'])
  # end
end
