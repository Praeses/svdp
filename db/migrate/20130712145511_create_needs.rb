class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :description
      t.string :account
      t.string :action
      t.string :date_of_action

      t.timestamps
    end
  end
end
