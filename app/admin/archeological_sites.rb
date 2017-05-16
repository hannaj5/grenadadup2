ActiveAdmin.register ArcheologicalSite do
  
  permit_params :site_number, :site_name, :parish, :latitude, :longitude,
                :location_description, :recommendations, :summary, :notes,
                :references
                
  index do
    selectable_column
    column 'Identifier', :site_number 
    column 'Name', :site_name
    column :parish
    
    # Use this test to limit access to certain information.
    column :latitude if current_user && current_user.can_be_user?
    column :longitude if current_user && current_user.can_be_user?
    column 'Description', :location_description
    column :summary
    column :notes
    column :references
    actions 
  end
  
  filter :site_number, label: 'Identifier'
  filter :site_name, label: 'Name'
  filter :latitude
  filter :longitude
  filter :location_description, label: 'Description'
  filter :summary
  filter :notes
  filter :references
  
  
  form do |f|
    f.semantic_errors
    f.actions
    f.inputs 'Archeological Site' do
      input :site_number, label: 'Identifier'
      input :site_name, label: 'Name'
      input :parish
      input :latitude
      input :longitude
      input :location_description, label: 'Description'
      input :recommendations
      input :summary
      input :notes
      input :references
    end
    f.actions
  end
  
 
  controller do
    
    # Gives us authenticate_user_access! method
    include ActiveAdmin::AccessControl
    
    # Add the role required to gain access. Empty means anyone can access.
    before_action -> { authenticate_user_access!() }
    
    # This takes away the buttons and links for things that can change a
    # resource unless the user can be an editor.
    def action_methods
      if current_user && current_user.can_be_editor?
        super
      else
        super - ['edit', 'destroy', 'new', 'create', 'update']
      end
    end
  
  end
end

