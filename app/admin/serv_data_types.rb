ActiveAdmin.register ServDataType do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :stype, :name, :model_type, :weight
  #
  # or
  #
  permit_params do
    permitted = [:stype, :name, :model_type, :weight]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

end
