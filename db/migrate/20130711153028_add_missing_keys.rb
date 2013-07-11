class AddMissingKeys < ActiveRecord::Migration
  def change
    add_reference :visits, :case_file, index: true
  end
end
