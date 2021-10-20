class CreateServiceTags < ActiveRecord::Migration[6.1]
  def change
    create_table :service_tags do |t|
      t.references :service, null: false, foreign_key: true
      t.string :tag

      t.timestamps
    end
  end
end
