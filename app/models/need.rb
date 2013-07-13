class Need < ActiveRecord::Base

  belongs_to :case_file
  belongs_to :need_tag, :class_name => "Tag", :foreign_key => "need_tag_id"
  belongs_to :action_tag, :class_name => "Tag", :foreign_key => "action_tag_id"

  #attr_accessible :need_tag_id,:description,:account,:action_tag_id,:action

end
