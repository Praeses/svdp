class Family < ActiveRecord::Base
  has_many :case_files
  has_many :people
  has_one :primay_addresses, as: :addressable
  has_many :addresses, as: :addressable
end
