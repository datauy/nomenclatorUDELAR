class Place < ApplicationRecord
  belongs_to :building
  has_and_belongs_to_many :people
  has_one :thing

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
