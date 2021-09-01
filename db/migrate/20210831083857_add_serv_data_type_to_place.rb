class AddServDataTypeToPlace < ActiveRecord::Migration[6.1]
  def change
    add_reference :places, :serv_data_type, null: false, foreign_key: true
  end
end
