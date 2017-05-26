# frozen_string_literal: true

# Provides some added access control functionality for active admin.
# Primarily increased graininess at the page level.
module ActiveAdmin::AccessControl
  extend ActiveSupport::Concern

  def authenticate_user_access!(access_level = nil)
    if access_level.nil?
      true
    else

      redirect_to new_user_session_path unless current_user

      unless current_user.send("can_be_#{access_level}?")
        raise ActionController::RoutingError,
              'Not Found'
      end
    end
  end
end
