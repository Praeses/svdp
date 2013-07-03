class CreateWishLists < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
