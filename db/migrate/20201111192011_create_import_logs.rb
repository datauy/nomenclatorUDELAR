class CreateImportLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :import_logs do |t|
      t.references :import_version, null: false, foreign_key: true
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end
  end
end
