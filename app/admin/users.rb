ActiveAdmin.register User do
  
  menu :if => proc{ current_user && current_user.can_be_admin? }
  
  permit_params :email, :role
  
  index do
    selectable_column
    column :email
    column :role
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :created_at
    column :updated_at
    actions
  end
  
  filter :email
  filter :role, as: :check_boxes, collection: proc { User.roles }
  filter :created_at
  filter :updated_at
  
  show do
    attributes_table do
      row :email
      row :role
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :created_at
      row :updated_at
    end
  end
  
  form do |f|
    f.semantic_errors
    f.inputs do
      input :email
      input :role
    end
    f.actions
  end
  
  controller do
    
    # Gives us authenticate_user_access! method
    include ActiveAdmin::AccessControl
    
    before_action -> { authenticate_user_access!(:admin) }

  end
end
