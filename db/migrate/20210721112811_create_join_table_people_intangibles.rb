class CreateJoinTablePeopleIntangibles < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :intangibles do |t|
      # t.index [:person_id, :intangible_id]
       t.index [:intangible_id, :person_id]
    end
  end
end
