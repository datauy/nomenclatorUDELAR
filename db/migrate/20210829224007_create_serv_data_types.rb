class CreateServDataTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :serv_data_types do |t|
      t.string :stype
      t.string :name
      t.integer :model_type
      t.integer :weight

      t.timestamps
    end
  end
end
