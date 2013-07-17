class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  #attr_accessible :line_1, :line_2, :line_3, :city, :state, :zip

  def to_family
    addressable.to_family
  end

  def to_s
    [line_1, line_2, line_3, city, state, zip].join(' ')
  end

end
