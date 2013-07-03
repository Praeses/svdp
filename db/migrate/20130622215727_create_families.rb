class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.text :name
      t.references :primary_address

      t.timestamps
    end
  end
end
