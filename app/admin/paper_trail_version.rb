ActiveAdmin.register PaperTrail::Version do
  menu label: 'Versions'
  actions :index, :show
  
  index title: 'Versions' do
    column 'Version' do |version|
      version.index + 1
    end
    column 'Item Name' do |version|
      version.item_type.underscore.humanize
    end
    column :event
    column 'Version Author' do |version|
      if version.version_author
        User.find(version.version_author).email
      else
        'System'
      end
    end
    column 'When' do |version|
      version.created_at
    end
    actions
  end
  
  show title: proc{ |version| "#{version.item_type} changed at #{version.created_at.strftime('%B %d, %Y %k:%M')}"} do
    attributes_table do
      row ('Current State') { |version| link_to version.item_id, send("admin_#{version.item_type.underscore}_path", version.item_id) }
      row ('Version ID') { |version| version.id }
      row ('Data Type') { |version| version.item_type }
      row :event
      row ('Version Author') { |version| User.find(version.whodunnit).email }
      row ('Version Date') { |version| version.created_at }
      row ('Changes') { |version| version.decorate.format_diff(:html) }
      row ('Data') { |version| version.decorate.pretty_object(:html) }
    end
  end

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

end
