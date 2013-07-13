class Person < ActiveRecord::Base
  #attr_accessible :first_name, :last_name, :phone, :ssn

  belongs_to :family
  has_many :addresses, as: :addressable
  has_many :visits
  has_many :users, through: :visits
  has_many :case_files, through: :visits

  scope :with_first, ->(term) do
    tbl = Person.arel_table
    Person.where(tbl[:first_name].matches("%#{term}%"))
  end

  scope :with_last, ->(term) do
    tbl = Person.arel_table
    Person.where(tbl[:last_name].matches("%#{term}%"))
  end

  scope :with_phone, ->(term) do
    tbl = Person.arel_table
    Person.where(tbl[:phone].matches("%#{term}%"))
  end

  class << self
    def search term
      with_first(term) + with_last(term) + with_phone(term)
    end
  end

  def to_s
    [first_name, last_name].join(' ')
  end

  def family_to_s
    family.to_s
  end
end
