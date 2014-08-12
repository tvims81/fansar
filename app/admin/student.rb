ActiveAdmin.register Student do
  index do
    column :name
    column :email
    column :grade
    column "Created", :created_at
    column "Updated", :updated_at
    column :state
    actions
  end

  permit_params :name, :email, :password_digest, :state, :grade, :avatar, :birthday,
                :phone, :city, :surname, :middlename, :school


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end


end
