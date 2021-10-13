ActiveAdmin.register Person do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :bio, :sex
  #
  # or
  #
  permit_params do
    permitted = [:name, :bio, :sex, :image]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end
  form do |f|
    f.input :name
    f.input :bio, as: :ckeditor
    f.input :sex
    f.input :image, as: :file
    if f.object.image.attached?
      f.li image_tag(url_for(f.object.image)).html_safe
    end
    f.actions
  end
end
