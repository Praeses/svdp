class Tag < ActiveRecord::Base

  has_many :needs
  #attr_accessible :name

end
