ActiveAdmin.register Province do
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
  permit_params :name, :pst, :gst, :hst

  index do
    selectable_column
    id_column
    column :name
    column :pst
    column :gst
    column :hst
    actions
  end

  filter :name
  filter :pst
  filter :gst
  filter :hst
end
