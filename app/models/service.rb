class Service < ApplicationRecord
  has_and_belongs_to_many :buildings
  has_and_belongs_to_many :intangibles
end
