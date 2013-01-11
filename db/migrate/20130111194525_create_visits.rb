class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date :date_of_visit
      t.text :note
      t.references :person

      t.timestamps
    end
    add_index :visits, :person_id
  end
end
