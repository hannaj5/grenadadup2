ActiveAdmin.register ArcheologicalSite do
  include ActiveAdmin::CustomBehavior
  
  config.sort_order = 'id_asc'

  permit_params :site_number,
                :site_name,
                :parish,
                :latitude,
                :longitude,
                :location_description,
                :recommendations,
                :summary,
                :notes,
                :references,
                :representative_image_id,
                ceramic_type_ids: [],
                ceramic_diagnostic_ids: [],
                threat_ids: [],
                previous_work_ids: [],
                maps_attributes: %i[id file name description _destroy],
                generic_files_attributes: %i[id file name description _destroy]

  # Invoke the decorator for the class
  decorate_with ArcheologicalSiteDecorator

  index do
    selectable_column
    column :id
    column '' do |site|
      site.decorate.representative_image
    end
    column 'Identifier', :site_number
    column 'Name', :site_name
    column :parish

    # Use this test to limit access to certain information.
    if current_user && current_user.can_be_user?
      column 'Coordinates (lat, long)', &:coordinates
    end

    #
    column 'Description' do |site|
      truncate(site.location_description)
    end
    
    column 'Maps' do |site|
      site.maps.count
    end

    column 'Files' do |site|
      site.generic_files.count
    end
    column 'Summary' do |site|
      truncate(site.summary)
    end
    
    column 'Versions' do |site|
      site.versions.size
    end

    # column :notes
    # column :references
    actions
  end

  filter :site_number, label: 'Identifier'
  filter :site_name, label: 'Name'
  filter :latitude,:as => :numeric_range, if: proc { current_user && current_user.can_be_user? }
  filter :longitude,:as => :numeric_range, if: proc { current_user && current_user.can_be_user? }
  filter :location_description, label: 'Description'
  filter :ceramic_types, as: :check_boxes
  filter :ceramic_diagnostics, as: :check_boxes
  filter :previous_works, as: :check_boxes
  filter :threats, as: :check_boxes
  # filter :summary
  # filter :notes
  filter :references

  show title: :site_name, span: 6 do

    panel 'Description' do
      content_tag :p, simple_format(resource.location_description)
    end
    panel 'Summary' do
      content_tag :p, simple_format(resource.summary)
    end
    panel 'Recommendations' do
      content_tag :p, simple_format(resource.recommendations)
    end
    panel 'References' do
      content_tag :p, simple_format(resource.references)
    end
    panel 'Maps' do
      paginated_collection(
        resource.maps.page(
          params[:maps_page]
        ).per(5),
        param_name: 'maps_page',
        download_links: false
      ) do
        table_for collection do
          column '' do |map|
            if map.file.file
              link_to image_tag(
                map.file.thumb.url, alt: map.name
              ), admin_map_path(map)
            else
              link_to image_tag('no-image_thumb.png'), admin_map_path(map)
            end
          end

          column 'Map Name' do |map|
            link_to truncate(map.name), admin_map_path(map)
          end

          column 'Description' do |map|
            # truncate(map.description)
            truncate(map.description)
          end

          column 'Dimensions (width X height)' do |map|
            "#{map.width}px X #{map.height}px" if map.file.file
          end

          column 'File Size' do |map|
            number_to_human_size(map.file.size)
          end

          column '' do |map|
            div class: 'table_actions' do
              links = [
                link_to(
                  'View',
                  admin_map_path(map),
                  class: 'view_link member_link'
                )
              ]
              if current_user && current_user.can_be_editor?
                links << link_to(
                  'Edit',
                  edit_admin_map_path(map),
                  class: 'edit_link member_link'
                )
                links << link_to(
                  'Delete',
                  delete_map_admin_archeological_site_path(map_id: map.id),
                  method: :delete,
                  data: { confirm: t('map.destroy') },
                  class: 'delete_link member_link'
                )
              end
              links << link_to(
                'Download',
                download_map_admin_archeological_site_path(map_id: map.id),
                class: 'download_link member_link'
              )
              links.join('&nbsp;').html_safe
            end
          end
        end # table_for
      end # paginated_collection for maps
    end # panel 'Maps'

    panel 'Files' do
      paginated_collection(
        resource.generic_files.page(params[:files_page]).per(10),
        param_name: 'files_page',
        download_links: false
      ) do
        table_for collection do
          column '' do |generic_file|
            link_to generic_file.name, admin_generic_file_path(generic_file)
          end

          column 'File Name' do |generic_file|
            link_to generic_file.name, admin_map_path(generic_file)
          end

          column 'Description' do |generic_file|
            # truncate(map.description)
            truncate(generic_file.description)
          end

          column 'File Size' do |generic_file|
            number_to_human_size(generic_file.file.size)
          end

          column '' do |generic_file|
            div class: 'table_actions' do
              links = [
                link_to(
                  'View',
                  admin_map_path(generic_file),
                  class: 'view_link member_link'
                )
              ]
              if current_user && current_user.can_be_editor?
                links << link_to(
                  'Edit', edit_admin_map_path(generic_file),
                  class: 'edit_link member_link'
                )
                links << link_to(
                  'Delete',
                  delete_generic_file_admin_archeological_site_path(
                    generic_file_id: generic_file.id
                  ),
                  method: :delete,
                  data: { confirm: t('generic_file.destroy') },
                  class: 'delete_link member_link'
                )
              end
              links << link_to(
                'Download',
                download_file_admin_archeological_site_path(
                  file_id: generic_file.id
                ),
                class: 'download_link member_link'
              )
              links.join('&nbsp;').html_safe
            end
          end # column <actions>
        end # table_for
      end  # paginatied_collection for files
    end # panel 'Files'
    
    panel 'Versions' do
      paginated_collection(
        resource.versions.reverse_order.page(params[:versions_page]).per(10),
        param_name: 'versions_page',
        download_links: false
      ) do
        table_for collection do
          column 'Version' do |version|
            link_to version.index + 1, admin_paper_trail_version_path(version)
          end
          column :event
          column 'Version Author' do |version|
            if version.version_author
              User.find(version.version_author.to_i).email
            else
              'System'
            end
          end
          column 'When' do |version|
            version.created_at
          end
        end # table_for
      end # paginated_collection
    end # panel 'versions'
  end

  sidebar 'Details', span: 3, only: :show do
    attributes_table_for resource do
      row ' ' do |site|
        site.representative_image
      end
      # row '' do |site|
      #   # site.decorate.representative_image
      # end
      row 'Site ID', &:site_number
      row :site_name
      row :parish
      if current_user && current_user.can_be_user?
        row 'Coordinates (lat, long)', &:coordinates
      end
      # row 'Description', &:location_description
      row 'Ceramic Types', &:ceramic_types_to_s
      row 'Ceramic Diagnostics', &:ceramic_diagnostics_to_s
      row 'Threats', &:threats_to_s
      row 'Previous Work', &:previous_works_to_s
      row :notes
      # row :references
      row 'Versions' do |site|
        site.versions.size
      end
    end
  end

  sidebar 'Upload CSV',
          partial: 'csv_upload_form',
          priority: 0,
          only: :index,
          if: proc { current_user && current_user.can_be_editor? }

  form title: :site_name, html: { multipart: true } do |f|
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
      f.input :previous_works, as: :select, input_html: { multiple: true }
      
      if f.object.maps.size > 0
        f.input :representative_image_id, as: :select, include_blank: true, collection:  Hash[f.object.maps.map{|m| [m.name.humanize,m.id]}]
      end
      
      f.input :location_description, label: 'Description'
      f.has_many :maps, allow_destroy: true do |m|
        m.input :name
        m.input :description
        m.input :file, as: :file
      end
      f.has_many :generic_files, allow_destroy: true do |m|
        m.input :name
        m.input :description
        m.input :file, as: :file
      end
      f.input :recommendations
      f.input :summary
      f.input :notes
      f.input :references
    end
    # f.actions
    f.actions do
      f.action :submit, label: 'Save'
      if action_name == 'new'
        f.action :submit, label: 'Save & New', wrapper_html: { class: ['cancel'] }
      end
      f.action :cancel, label: 'Cancel', wrapper_html: { class: ['cancel'] }
    end
  end
  
  action_item :previous, only: [:show, :edit],  :if => proc { archeological_site.previous != nil } do
    link_to 'Previous', admin_archeological_site_path(archeological_site.previous)
  end
  
  action_item :next, only: [:show, :edit], :if => proc { archeological_site.next != nil } do
    link_to 'Next', admin_archeological_site_path(archeological_site.next)
  end

  member_action :delete_map, method: :delete do
    map = Map.find(params[:map_id])
    map.destroy
    redirect_to admin_archeological_site_path(params[:id])
  end

  member_action :delete_generic_file, method: :delete do
    generic_file = GenericFile.find(params[:generic_file_id])
    generic_file.destroy
    redirect_to admin_archeological_site_path(params[:id])
  end

  member_action :download_map, method: :get do
    map = Map.find params[:map_id]
    if map.file.file
      download = open(map.file.path)
      send_data download.read,
                filename: map.file.file.filename,
                type: map.file.content_type,
                disposition: 'attachment'
    end
  end
# send_data file, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment;data=#{csv_file}.csv"
  collection_action :downlaod_sample_csv, method: :get do
    sample_file = File.open('public/downloads/example_upload.csv')
    send_data sample_file.read,
              filename: sample_file.path.split('/').last,
              type: 'txt/csv',
              disposition: "attachment; data=#{sample_file}.csv"
  end

  collection_action :upload_csv, method: :post do
    flash[:notice] = t('archeological_site.csv_file.upload.success')
    sites_file = SiteFile.new
    sites_file.file = params[:site_file][:file]
    sites_file.save
    UploadCsvJob.perform_later(sites_file.id)
    redirect_to admin_archeological_sites_path
  end

  member_action :download_file, method: :get do
    generic_file = GenericFile.find params[:file_id]
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

    # Add the role required to gain access. Empty means anyone can access.
    before_action -> { authenticate_user_access! }

    # Need to do this to give the semantic upload form to use.
    def index
      @site_file = SiteFile.new
      super
    end

    # This takes away the buttons and links for things that can change a
    # resource unless the user can be an editor.
    def action_methods
      if current_user && current_user.can_be_editor?
        super
      else
        super - %w[edit destroy new create update]
      end
    end
  end
end
