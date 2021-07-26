class Intangible < ApplicationRecord
  has_and_belongs_to_many :services
  has_and_belongs_to_many :people
  has_one :thing
end
