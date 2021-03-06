ActiveAdmin.register CeramicDiagnostic do
  include ActiveAdmin::CustomBehavior

  actions :all, except: [:show]
  menu if: proc { current_user && current_user.can_be_admin? }

  permit_params :name, :description

  index do
    id_column
    column :name
    column :description
    actions
  end

  filter :name

  form do |f|
    f.semantic_errors
    f.inputs do
      input :name
      input :description
    end
    # f.actions
    f.actions do
      f.action :submit, label: 'Save'
      f.action :submit, label: 'Save & New', wrapper_html: { class: ['cancel'] }
      f.action :cancel, label: 'Cancel', wrapper_html: { class: ['cancel'] }
    end
  end

  controller do
    # Gives us authenticate_user_access! method
    include ActiveAdmin::AccessControl

    before_action -> { authenticate_user_access!(:admin) }
  end
end

#   t.string   "email",                  default: "", null: false
#     t.string   "encrypted_password",     default: "", null: false
#     t.string   "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.integer  "sign_in_count",          default: 0,  null: false
#     t.datetime "current_sign_in_at"
#     t.datetime "last_sign_in_at"
#     t.inet     "current_sign_in_ip"
#     t.inet     "last_sign_in_ip"
#     t.datetime "created_at",                          null: false
#     t.datetime "updated_at",                          null: false
#     t.integer  "role",
