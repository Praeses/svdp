class CaseFile < ActiveRecord::Base
  belongs_to :family
  has_many :needs
  has_many :visits
  has_many :people, through: :visits
  has_many :users, through: :visits

  before_validation( :on => :create ) do
    self.date = Date.today unless self.date
    self.number = ( CaseFile.maximum("number") || 0) + 1 unless self.number
  end

  accepts_nested_attributes_for :needs
  #attr_accessible :number, :date, :comment,:needs,:needs_attributes

  def to_family
    family
  end
end
