class CaseFile < ActiveRecord::Base
  belongs_to :family
  has_many :visits
  has_many :people, through: :visits
  has_many :users, through: :visits

  before_validation( :on => :create ) do
    self.number = ( CaseFile.maximum("number") || 0) + 1 unless self.number
  end

  attr_accessible :number, :date, :comment

end
