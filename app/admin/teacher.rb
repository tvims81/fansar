ActiveAdmin.register Teacher do

  permit_params :name, :email, :password, :password_confirmation, :state, :avatar, :birthday, :phone, :city, :surname, :middlename
=begin
  controller do
    def new
      form_for :teacher do |f|
        f.inputs "Teacher Details" do
          f.input :name
          f.input :email
          f.input :password
          f.input :password_confirmation
        end
        f.actions
      end
    end  
  end
=end
  
  form do |f|
    f.inputs "Teacher Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :state
    end
    f.actions
  end

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
