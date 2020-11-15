class CreateIntangibles < ActiveRecord::Migration[6.0]
  def change
    create_table :intangibles do |t|
      t.references :building, null: false, foreign_key: true
      t.text :detail
      t.string :noun
      t.string :name
      t.references :person, null: false, foreign_key: true
      t.text :observations
      t.text :naming_details
      t.date :naming_date

      t.timestamps
    end
  end
end
