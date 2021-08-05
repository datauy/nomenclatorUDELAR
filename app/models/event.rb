class Event < ApplicationRecord
  enum etype: [
    :'Femenino',
    :'Masculino',
    :'Hito'
  ]
end
