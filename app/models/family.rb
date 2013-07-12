class Family < ActiveRecord::Base
  has_many :case_files
  has_many :people
  has_one :primay_addresses, as: :addressable
  has_many :addresses, as: :addressable


  scope :with_name, ->(term) do
    tbl = Family.arel_table
    Family.where(tbl[:name].matches("%#{term}%"))
  end

  class << self
    def search term
      with_name( term )
    end
  end
end
