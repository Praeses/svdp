class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date :date_of_visit
      t.text :note
      t.references :person
      t.references :user
      t.text :needs
      t.text :income
      t.text :skills
      t.text :action

      t.timestamps
    end
    add_index :visits, :person_id
    add_index :visits, :user_id
  end
end
