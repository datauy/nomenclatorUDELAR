class ServDataType < ApplicationRecord
  has_one_attached :icon

  enum model_type:[
    "estudiante",
    "funcionarie",
    "docente",
    "places"
  ]
end
