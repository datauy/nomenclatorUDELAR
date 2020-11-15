class CreateImportVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :import_versions do |t|
      t.string :name

      t.timestamps
    end
  end
end
