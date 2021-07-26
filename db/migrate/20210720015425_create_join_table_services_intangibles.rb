class CreateJoinTableServicesIntangibles < ActiveRecord::Migration[6.1]
  def change
    create_join_table :services, :intangibles do |t|
      t.index [:service_id, :intangible_id]
      # t.index [:intangible_id, :service_id]
    end
  end
end
