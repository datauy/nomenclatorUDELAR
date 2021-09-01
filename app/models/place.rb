class Place < ApplicationRecord
  belongs_to :building
  belongs_to :serv_data_type
  has_and_belongs_to_many :people
  has_one :thing

end
