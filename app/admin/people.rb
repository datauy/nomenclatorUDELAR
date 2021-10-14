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
  index do
    selectable_column
    column :name
    column :bio
    column :sex
    column :image do |l|
      "<div class='rounded-image-wrapper'>#{image_tag url_for(l.image) if l.image.attached?}</div>".html_safe
    end
    actions
  end
  form do |f|
    f.inputs do
      f.input :name
      f.input :bio, as: :ckeditor
      f.input :sex
      f.input :image, as: :file
      if f.object.image.attached?
        f.li image_tag(url_for(f.object.image)).html_safe
      end
    end
    f.actions
  end
end
