module ActiveAdmin::AccessControl
  extend ActiveSupport::Concern    
  
  def authenticate_user_access!(access_level = nil)
    
    if access_level.nil?
      return true
    else
    
      redirect_to new_user_session_path unless current_user
      
      raise ActionController::RoutingError.new('Not Found') unless current_user.send("can_be_#{access_level.to_s}?")
    end
  end
end