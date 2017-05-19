ActiveAdmin.register ArcheologicalSite do
  
  permit_params :site_number, :site_name, :parish, :latitude, :longitude,
                :location_description, :recommendations, :summary, :notes, 
                :references, ceramic_type_ids: [], ceramic_diagnostic_ids: [],
                threat_ids: [], previous_work_ids: [], maps_attributes: [:file, :name],
                generic_files_attributes: [:file, :name]
                
  # Invoke the decorator for the class
  decorate_with ArcheologicalSiteDecorator
                
  index do
    selectable_column
    column 'Identifier', :site_number 
    column 'Name', :site_name
    column :parish
    
    # Use this test to limit access to certain information.
    if current_user && current_user.can_be_user?
      column 'Coordinates (lat, long)' do |site|
        "#{site.latitude.round(2)}, #{site.longitude.round(2)}"
      end
    end
    column 'Description' do |site| 
      truncate(site.location_description)
    end
    # Took these out to clear up the table.
    # Left the filters and they are in the show.
    # column 'Ceramic Types' do |site|
    #   site.ceramic_types_to_s
    # end
    # column 'Ceramic Diagnostics' do |site|
    #   site.ceramic_diagnostics_to_s
    # end
    # column 'Threats' do |site|
    #   site.threats_to_s
    # end
    # column 'Previous Work' do |site|
    #   site.previous_works_to_s
    # end
    column 'Maps' do |site|
      site.maps.count
    end
    column 'Generic Files' do |site|
      site.generic_files.count
    end
    column 'Summary' do |site|
      truncate(site.summary)
    end
    
    # column :notes
    # column :references 
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
  # filter :summary
  # filter :notes
  filter :references
  
  show title: :site_name do
    panel 'Maps' do
      table_for resource.maps do
        column '' do |map|
          if map.file.file
            link_to image_tag(map.file.thumb.url, alt: map.name), admin_map_path(map)
          else
            link_to image_tag('no-image_thumb.png'), admin_map_path(map)
          end
        end
        
        column 'Map Name' do |map|
          link_to map.name, admin_map_path(map)
        end
        
        column 'Description' do |map|
          # truncate(map.description)
          map.description
        end
        
        column 'Dimensions (width X height)' do |map|
          "#{map.width}px X #{map.height}px" if map.file.file
        end
        
        column 'File Size' do |map|
          number_to_human_size(map.file.size)
        end
      end
    end
    
    # ink_to image_tag("Search.png", border: 0), {action: 'search', controller: 'pages'}, {class: 'dock-item'}
    
    
  end
  
  sidebar "Details", only: :show do
    attributes_table_for resource do
      row :site_number
      row :site_name
      row :parish
      if current_user && current_user.can_be_user?
        row ('Coordinates (lat, long)') { 
          |site| site.formatted_coordinates 
        }
      end
      row ('Description') { |site| site.location_description }
      row ('Ceramic Types') { |site| site.ceramic_types_to_s }
      row ('Ceramic Diagnostics') { |site| site.ceramic_diagnostics_to_s }
      row ('Threats') { |site| site.threats_to_s }
      row ('Previous Work') { |site| site.previous_works_to_s }
      row :summary
      row :notes
      row :references
    end
  end
  
  
  form title: :site_name, :html => { :multipart => true } do |f|
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
      f.has_many :generic_files, allow_destroy: true do |m|
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

