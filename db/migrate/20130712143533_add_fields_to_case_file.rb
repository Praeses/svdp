class AddFieldsToCaseFile < ActiveRecord::Migration
  def change
    add_column :case_files, :comment, :text
  end
end
