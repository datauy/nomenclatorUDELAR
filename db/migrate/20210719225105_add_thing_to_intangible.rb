class AddThingToIntangible < ActiveRecord::Migration[6.1]
  def change
    add_reference :intangibles, :thing, foreign_key: true
  end
end
