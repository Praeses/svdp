class Family < ActiveRecord::Base

  has_many :people
  has_one :primay_addresses, as: :addressable
  has_many :addresses, as: :addressable

  validates :name, presence:true

  accepts_nested_attributes_for :addresses

  attr_accessible :name, :addresses, :addresses_attributes

end
