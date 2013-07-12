class CaseFileAdditions < ActiveRecord::Migration
  def change
    add_reference :case_files, :family, index: true
  end
end
