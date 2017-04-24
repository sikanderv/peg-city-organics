ActiveAdmin.register User do
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

    # parameters permitted to be changed by activeadmin
    permit_params :username, :name, :address, :province_id, :email, :password

    index do
      selectable_column
      id_column
      column :username
      column :name
      column :email
      column :address
      column :province
      column :encrypted_password
      actions
    end

    filter :username
    filter :name
    filter :email
    filter :address
    filter :province
    filter :encrypted_password

    form do |f|
      f.inputs "User Details" do
        f.input :username
        f.input :name
        f.input :email
        f.input :address
        f.input :province,
                :as => :select,
                :label_method => :name,
                :value_method => :id,
                include_blank: 'Select Province'
        f.input :password, required: true, hint: ("#{@minimum_password_length} characters minimum" if @minimum_password_length)
        f.input :password_confirmation, required: true
      end
      f.actions
    end

    controller do
      def update
        if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
          params[:user].delete("password")
          params[:user].delete("password_confirmation")
        end
        super
      end
    end
end
