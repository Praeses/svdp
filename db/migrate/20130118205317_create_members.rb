class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :dob
      t.boolean :male
      t.references :person

      t.timestamps
    end
    add_index :members, :person_id
  end
end
