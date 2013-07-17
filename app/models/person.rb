class Person < ActiveRecord::Base
  #attr_accessible :first_name, :last_name, :phone, :ssn

  belongs_to :family
  has_many :addresses, as: :addressable
  has_many :visits
  has_many :users, through: :visits
  has_many :case_files, through: :visits

  def to_family
    family
  end

  def to_s
    [first_name, last_name].join(' ')
  end

end
