class AddCaseFileToNeed < ActiveRecord::Migration
  def change
    add_reference :needs, :case_file, index: true
  end
end
