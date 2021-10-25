class Person < ApplicationRecord
  has_one_attached :image
  has_and_belongs_to_many :places
  has_and_belongs_to_many :intangibles
  enum sex: [
    :'Masculino',
    :'Femenino',
    :'Masculino y Femenino',
    :'Femenino y Masculino',
  ]
  enum place_prefix: [
    'Biblioteca ',
    'Sala de ',
    'exposiciones ',
    'Exposiciones ',
    'Exposición ',
    'Casa ',
    'Sala '
  ]
end
