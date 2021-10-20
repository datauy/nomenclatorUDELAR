ActiveAdmin.register Building do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :address, :state
  #
  # or
  #
  permit_params do
    permitted = [:name, :address, :state]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end

end
