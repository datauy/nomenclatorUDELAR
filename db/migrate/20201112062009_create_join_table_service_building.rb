class CreateJoinTableServiceBuilding < ActiveRecord::Migration[6.0]
  def change
    create_join_table :services, :buildings do |t|
      t.index [:service_id, :building_id]
      # t.index [:building_id, :service_id]
    end
  end
end
