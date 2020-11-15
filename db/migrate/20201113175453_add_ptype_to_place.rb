class AddPtypeToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :ptype, :integer
  end
end
