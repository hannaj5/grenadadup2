ActiveAdmin.register Map do
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
  
  index do
    column :name
    column 'Description' do |map|
      truncate(map.description)
    end
    column 'File Name' do |map|
      map.file.file.filename
    end
    column :width
    column :height
    actions defaults: true do |map|
      link_to('Download', download_admin_map_path(map))
    end
  end
  
  show title: :name do
    panel 'Map' do
      image_tag resource.file.url
    end
  end
  
  
  
  form title: :name, :html => { :multipart => true } do |f|
    f.semantic_errors
    f.actions
    f.inputs 'Map Details' do
      f.input :name
      f.input :archeological_site, 
        as: :select, 
        collection: Hash[ArcheologicalSite.all.collect { |site| [site.site_name, site.id] } ]
      f.input :file
      f.input :description
    end
    f.actions
  end
   
  sidebar "Map Details", only: :show do
    attributes_table_for resource do
      
      row ('Map Name') { |map| map.name }
      row ('Description') { |map| map.description }
      
      if resource.file.file
        dims =  "#{resource.width}px X #{resource.height}px" 
      else
        dims = ''
      end
      
      row ('Dimensions (width X height)') { dims }

      
      row 'File Size' do |map|
        number_to_human_size(map.file.size)
      end
    end
  end
  
  action_item :foo, only: :show do
    link_to 'Download', download_admin_map_path(resource)
  end
  
  member_action :download, method: :get do
    map = Map.find params[:id]
    if map.file.file
      download = open(map.file.path)
      send_data download.read, :filename => map.file.file.filename, :type => map.file.content_type, :disposition => "attachment"
    end
  end
    

end
