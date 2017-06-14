ActiveAdmin.register PaperTrail::Version do
  actions :index, :show
  menu label: 'Versions', if: proc { current_user && current_user.can_be_admin? }
  decorate_with PaperTrail::VersionDecorator
  
  index title: 'Versions' do
    column 'Version' do |version|
      version.index + 1
    end
    column 'Item Name' do |version|
      version.item_type.underscore.humanize
    end
    column :event
    column 'Version Author' do |version|
      version.version_author_name
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
      row ('Version Author') { |version| version.version_author_name }
      row ('Version Date') { |version| version.created_at }
      row ('Changes') { |version| version.decorate.format_diff(:html) }
      row ('Data') { |version| version.decorate.pretty_object(:html) }
    end
  end


  controller do
    # Gives us authenticate_user_access! method
    include ActiveAdmin::AccessControl

    before_action -> { authenticate_user_access!(:admin) }, except: :show

  end

end
