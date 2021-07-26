class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.references :building, null: false, foreign_key: true
      t.integer :type
      t.string :detail
      t.string :name
      t.text :observations
      t.text :naming_details
      t.date :naming_date

      t.timestamps
    end
  end
end
