class Family < ActiveRecord::Base
  has_many :case_files
  has_many :people
  has_one :primay_address, as: :addressable, class_name: Address
  has_many :addresses, as: :addressable

  validates :name, presence:true
  accepts_nested_attributes_for :addresses
  attr_accessible :name, :addresses, :addresses_attributes

  scope :with_name, ->(term) do
    tbl = Family.arel_table
    Family.where(tbl[:name].matches("%#{term}%"))
  end

  class << self
    def search term
      with_name( term )
    end
  end

  def to_s
    name
  end

  def extra_to_s
  end

  def family_to_s
    name
  end

  def persion_to_s
    people.map(&:to_s).join(',')
  end

  def address_to_s
    primay_address.to_s
  end
end
