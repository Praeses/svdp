class AddSsnToPerson < ActiveRecord::Migration
  def change
    add_column :people, :ssn, :string, :limit => 4
  end
end
