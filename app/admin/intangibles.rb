ActiveAdmin.register Intangible do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :detail, :noun, :name, :observations, :naming_details, :naming_date, :thing_id
  #
  # or
  #
  permit_params do
    permitted = [:detail, :noun, :name, :observations, :naming_details, :naming_date, :thing_id]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end
  form do |f|
    f.inputs do
      f.input :detail
      f.input :noun
      f.input :name
      f.input :observations, as: :ckeditor
      f.input :naming_date
      f.input :naming_details, as: :ckeditor
      f.input :people, :collection => Person.order(:name).all.map{|s| [s.name, s.id]}
    end
    f.actions
  end

end
