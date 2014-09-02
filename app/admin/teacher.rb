ActiveAdmin.register Teacher do

  permit_params :name, :email, :password, :password_confirmation, 
  :state, :avatar, :birthday, :phone, :city, :surname, :middlename
  
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

  action_item do
    link_to 'Invite New Teacher', new_invitation_admin_teachers_path
  end
 
  collection_action :new_invitation do
   @teacher = Teacher.new
  end 
 
  collection_action :send_invitation, :method => :post do 
    if @teacher.invite
     flash[:success] = "Teacher has been successfully invited." 
     redirect_to admin_teachers_path
    end
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
