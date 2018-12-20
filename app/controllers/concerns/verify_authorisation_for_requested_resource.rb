module VerifyAuthorisationForRequestedResource
  extend ActiveSupport::Concern

  def verify_resource_is_authorised
    resource = @activity.try(:kid).try(:parent) || @kid.try(:parent) || @parent
    return request_forbidden if resource != current_parent
  end
end
