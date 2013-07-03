class CreateCaseFiles < ActiveRecord::Migration
  def change
    create_table :case_files do |t|
      t.string :name
      t.datetime :date
      t.integer :number

      t.timestamps
    end
  end
end
