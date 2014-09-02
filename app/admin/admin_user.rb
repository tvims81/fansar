ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  action_item do
    link_to 'Invite New Admin', new_invitation_admin_admin_users_path
  end
 
  collection_action :new_invitation do
   @admin = AdminUser.new
  end 
 
  collection_action :send_invitation, :method => :post do
    @admin = AdminUser.invite!(params[:admin_user], current_user)
    if @admin.errors.empty?
     flash[:success] = "Admin has been successfully invited." 
     redirect_to admin_admin_users_path
    else
      messages = @admin.errors.full_messages.map { |msg| msg }.join
      flash[:error] = "Error: " + messages
      redirect_to new_invitation_admin_admin_users_path
    end
  end
end
