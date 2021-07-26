class Thing < ApplicationRecord
  has_many :places
  enum ttype: [
    'Otres',
    'Planetas',
    'Plantas',
    'Accidentes Geográficos'
  ]
end
