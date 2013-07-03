class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :addressable_id
      t.string :addressable_type
      t.string :line_1
      t.string :line_2
      t.string :line_3
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
