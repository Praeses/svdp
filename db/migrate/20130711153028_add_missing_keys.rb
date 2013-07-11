class AddMissingKeys < ActiveRecord::Migration
  def change
    add_reference :visits, :case_file, index: true
    add_reference :people, :family, index: true
  end
end
