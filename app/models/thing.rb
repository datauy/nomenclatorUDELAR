class Thing < ApplicationRecord
  has_one_attached :image
  has_many :places
  has_many :intangibles
  enum ttype: [
    'Otres',
    'Planetas',
    'Plantas',
    'Accidentes Geográficos'
  ]
  def sex
    "Cosa"
  end
  def bio
    self.description
  end
end
