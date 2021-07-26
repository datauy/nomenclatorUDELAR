class CreateJoinTablePlacesPeople < ActiveRecord::Migration[6.1]
  def change
    create_join_table :places, :people do |t|
      t.index [:place_id, :person_id]
      # t.index [:person_id, :place_id]
    end
  end
end
