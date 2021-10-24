class AddSweightToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :sweight, :integer
  end
end
