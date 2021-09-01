class CreateServiceData < ActiveRecord::Migration[6.1]
  def change
    create_table :service_data do |t|
      t.references :service, null: false, foreign_key: true
      t.integer :man
      t.integer :woman
      t.integer :year

      t.timestamps
    end
  end
end
