ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  permit_params :parent_id, :category_id, :name, :sku, :description, :active, :weight, :price, :cost_price, :featured, :stock_control, :image, :on_sale

  index do
    column :name
    column :sku
    column :description
    column :price, :sortable => :price do |product|
      div :class => "price" do
          number_to_currency product.price
     end
    end

    column "Image" do |product|
        image_tag product.image
    end

    actions
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
