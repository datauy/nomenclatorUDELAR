class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.text :bio
      t.integer :sex

      t.timestamps
    end
  end
end
