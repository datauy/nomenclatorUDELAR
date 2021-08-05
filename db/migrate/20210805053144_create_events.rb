class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :etype
      t.string :title
      t.text :description
      t.integer :value
      t.date :edate

      t.timestamps
    end
  end
end
