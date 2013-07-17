class Family < ActiveRecord::Base
  has_many :case_files
  has_many :people
  has_one :primay_address, as: :addressable, class_name: Address
  has_many :addresses, as: :addressable

  validates :name, presence:true
  accepts_nested_attributes_for :addresses
  #attr_accessible :name, :addresses, :addresses_attributes

  def to_family
    self
  end

  def to_s
    name
  end

end
