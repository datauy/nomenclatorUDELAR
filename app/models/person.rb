class Person < ApplicationRecord
  enum sex: [
    'Masculino',
    'Femenino',
    'Masculino y Femenino',
    'Femenino y Masculino',
  ]
end
