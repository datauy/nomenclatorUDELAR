class Service < ApplicationRecord
  has_and_belongs_to_many :buildings
  has_and_belongs_to_many :intangibles

  has_many :service_tags

  def self.search(query)
    textual = Service.find_by(name: query)
    if textual.blank?
      sid = ServiceTag.select(:id).where(tag: query)
      if sid.present?
        Service.find( sid.ids[0] )
      end
    else
      textual
    end
  end
end
