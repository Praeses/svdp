class AddTagsToNeed < ActiveRecord::Migration
  def change
    add_column :needs, :need_tag_id, :integer
    add_column :needs, :action_tag_id, :integer
  end
end
