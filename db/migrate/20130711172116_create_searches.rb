class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :term
      t.datetime :start_time
      t.datetime :end_time
      t.integer :count

      t.timestamps
    end
  end
end
