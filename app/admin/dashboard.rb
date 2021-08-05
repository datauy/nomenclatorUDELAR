ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Buen día mortales..."
        small "Hoy puede ser un gran día"
      end
    end

    columns do
       column do
         panel "Lugares por sexo" do
           ul do
             Place.
             joins(:people).
             group("people.sex").
             count.
             map do |gender, qtty|
               li "#{Person.sexes.key(gender)}: #{qtty}"
             end
           end
         end
       end
       column do
         panel "La persona del día: " do
           para Person.order('RANDOM()').pluck(:bio).first
         end
       end
     end
  end # content
end
