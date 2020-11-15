class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.integer :state

      t.timestamps
    end
  end
end
