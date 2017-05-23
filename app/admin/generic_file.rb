ActiveAdmin.register GenericFile do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
 permit_params :name, :file, :description, :archeological_site_id
 
 
  
  controller do
    
    # Gives us authenticate_user_access! method
    include ActiveAdmin::AccessControl
    
    before_action -> { authenticate_user_access!(:admin) }
  
  end

end
