ActiveAdmin.register ArcheologicalSite do
  
  permit_params :site_number, :site_name, :parish, :latitude, :longitude,
                :location_description, :recommendations, :summary, :notes, 
                :references, ceramic_type_ids: [], ceramic_diagnostic_ids: [],
                threat_ids: [], previous_work_ids: [], maps_attributes: [:file, :name]
                
  # Invoke the decorator for the class
  decorate_with ArcheologicalSiteDecorator
                
  index do
    selectable_column
    column 'Identifier', :site_number 
    column 'Name', :site_name
    column :parish
    
    # Use this test to limit access to certain information.
    column :latitude if current_user && current_user.can_be_user?
    column :longitude if current_user && current_user.can_be_user?
    column 'Description', :location_description
    column 'Ceramic Types' do |site|
      site.ceramic_types_to_s
    end
    column 'Ceramic Diagnostics' do |site|
      site.ceramic_diagnostics_to_s
    end
    column 'Threats' do |site|
      site.threats_to_s
    end
    column 'Previous Work' do |site|
      site.previous_works_to_s
    end
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
  filter :ceramic_types, as: :check_boxes
  filter :ceramic_diagnostics, as: :check_boxes
  filter :previous_works, as: :check_boxes
  filter :threats, as: :check_boxes
  filter :summary
  filter :notes
  filter :references
  
  
  form(:html => { :multipart => true }) do |f|
    f.semantic_errors
    f.actions
    f.inputs 'Archeological Site' do
      f.input :site_number, label: 'Identifier'
      f.input :site_name, label: 'Name'
      f.input :parish
      f.input :latitude
      f.input :longitude    
      f.input :ceramic_types, as: :check_boxes
      f.input :ceramic_diagnostics, as: :check_boxes
      f.input :threats, as: :check_boxes
      f.input :previous_works, as: :select, input_html: {multiple: true}
      f.input :location_description, label: 'Description'
      f.has_many :maps, allow_destroy: true do |m|
        m.input :name
        m.input :file, as: :file
      end
      f.input :recommendations
      f.input :summary
      f.input :notes
      f.input :references
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

