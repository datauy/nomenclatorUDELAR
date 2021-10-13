ActiveAdmin.register ServiceDatum do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :service_id, :stype, :man, :woman
  #
  # or
  #
  permit_params do
    permitted = [:service_id, :stype, :man, :woman]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end

end
