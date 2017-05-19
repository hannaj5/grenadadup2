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

  permit_params :name, :file, :archeological_site_id
  
  show title: :name do
    panel 'Map' do
      image_tag resource.file.url
    end
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
    

end
