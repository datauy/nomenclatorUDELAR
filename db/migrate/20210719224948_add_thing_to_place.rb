class AddThingToPlace < ActiveRecord::Migration[6.1]
  def change
    add_reference :places, :thing, foreign_key: true
  end
end
