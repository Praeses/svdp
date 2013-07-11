class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  attr_accessible :line_1, :line_2, :line_3, :city, :state, :zip

end
