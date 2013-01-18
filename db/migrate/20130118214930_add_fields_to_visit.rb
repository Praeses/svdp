class AddFieldsToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :needs,  :text
    add_column :visits, :income, :text
    add_column :visits, :skills, :text
    add_column :visits, :action, :text
  end
end
