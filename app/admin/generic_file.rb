ActiveAdmin.register GenericFile do
  include ActiveAdmin::CustomBehavior

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
      link_to('Download', download_admin_generic_file_path(map))
    end
  end

  action_item :download, only: :show do
    link_to 'Download File', download_admin_generic_file_path(resource)
  end

  member_action :download, method: :get do
    generic_file = GenericFile.find params[:id]
    if generic_file.file.file
      download = open(generic_file.file.path)
      send_data download.read,
                filename: generic_file.file.file.filename,
                type: generic_file.file.content_type,
                disposition: 'attachment'
    end
  end

  controller do
    # Gives us authenticate_user_access! method
    include ActiveAdmin::AccessControl

    before_action -> { authenticate_user_access!(:admin) }
  end
end
