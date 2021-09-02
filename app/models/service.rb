class Service < ApplicationRecord
  has_and_belongs_to_many :buildings
  has_and_belongs_to_many :intangibles

  has_many :service_tags

  def self.search(query)
    textual = Service.find_by(name: query)
    if textual.blank?
      sid = ServiceTag.select(:service_id).where(tag: query)
      if sid.present?
        Service.find( sid.first.service_id )
      end
    else
      textual
    end
  end
end
