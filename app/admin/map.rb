ActiveAdmin.register Map do
  include ActiveAdmin::CustomBehavior

  permit_params :name, :file, :description, :archeological_site_id
  
  menu if: proc { current_user && current_user.can_be_admin? }

  index do
    column '' do |map|
      if map.file.file
        link_to image_tag(
          map.file.thumb.url, alt: map.name
        ), admin_map_path(map)
      else
        link_to image_tag('no-image_thumb.png'), admin_map_path(map)
      end
    end
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

  form title: :name, html: { multipart: true } do |f|
    f.semantic_errors
    f.actions
    f.inputs 'Map Details' do
      f.input :name
      f.input :archeological_site,
              as: :select,
              collection: Hash[ArcheologicalSite.all.collect do |site|
                                 [site.site_name, site.id]
                               end
              ]
      f.input :file
      f.input :description
    end
    # f.actions
    f.actions do
      f.action :submit, label: 'Save'
      f.action :submit, label: 'Save & New', wrapper_html: { class: ['cancel'] }
      f.action :cancel, label: 'Cancel', wrapper_html: { class: ['cancel'] }
    end
  end

  sidebar 'Map Details', only: :show do
    attributes_table_for resource do
      row 'Map Name', &:name
      row 'Description', &:description

      dims = if resource.file.file
               "#{resource.width}px X #{resource.height}px"
             else
               ''
             end

      row 'Dimensions (width X height)' do
        dims
      end

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
      send_data download.read,
                filename: map.file.file.filename,
                type: map.file.content_type, disposition: 'attachment'
    end
  end
  
  controller do
    # Gives us authenticate_user_access! method
    include ActiveAdmin::AccessControl

    before_action -> { authenticate_user_access!(:admin) }
  end
end
