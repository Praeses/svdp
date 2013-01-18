class Person < ActiveRecord::Base
  attr_accessible :address, :church, :first_name, :last_name

  has_many :visits
  has_many :members

end
