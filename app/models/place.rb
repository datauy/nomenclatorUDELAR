class Place < ApplicationRecord
  belongs_to :building
  belongs_to :person

  enum ptype: [
    'Edificio',
    'Aula Magna',
    'Salón de Actos',
    'Sala de reuniones',
    'Salones comunes',
    'Laboratorio',
    'Hall',
    'Patio',
    'Explanada',
    'Biblioteca',
    'Otro (Especificar)',
  ]
end
