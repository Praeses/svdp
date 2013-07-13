class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  #attr_accessible :line_1, :line_2, :line_3, :city, :state, :zip

  scope :with_line_1, ->(term) do
    tbl = Address.arel_table
    Address.where(tbl[:line_1].matches("%#{term}%"))
  end

  scope :with_line_2, ->(term) do
    tbl = Address.arel_table
    Address.where(tbl[:line_2].matches("%#{term}%"))
  end

  scope :with_line_3, ->(term) do
    tbl = Address.arel_table
    Address.where(tbl[:line_3].matches("%#{term}%"))
  end

  scope :with_city, ->(term) do
    tbl = Address.arel_table
    Address.where(tbl[:city].matches("%#{term}%"))
  end

  scope :with_state, ->(term) do
    tbl = Address.arel_table
    Address.where(tbl[:state].matches("%#{term}%"))
  end

  scope :with_zip, ->(term) do
    tbl = Address.arel_table
    Address.where(tbl[:zip].matches("%#{term}%"))
  end

  class << self
    def search term
      with_line_1(term) +
      with_line_2(term) +
      with_line_3(term) +
      with_city(term)   +
      with_state(term)  +
      with_zip(term)
    end
  end


  def to_s
    [line_1, line_2, line_3, city, state, zip].join(' ')
  end


  def family_to_s
  end

  def persion_to_s
  end

  def extra_to_s
    addressable.to_s
  end
end
