ActiveAdmin.register Place do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :building_id, :type, :detail, :name, :person_id, :observations, :naming_details, :naming_date, :ptype
  #
  # or
  #
  permit_params do
    permitted = [:building_id, :type, :detail, :name, :observations, :naming_details, :naming_date, :serv_data_type_id, person_ids:[] ]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end
  form do |f|
    f.inputs do
      f.input :building
      f.input :serv_data_type
      f.input :detail
      f.input :name
      f.input :observations, as: :ckeditor
      f.input :naming_details, as: :ckeditor
      f.input :naming_date
      f.input :people, :collection => Person.order(:name).all.map{|s| [s.name, s.id]}
    end
    f.actions
  end
end
