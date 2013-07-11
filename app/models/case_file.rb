class CaseFile < ActiveRecord::Base
  has_many :visits
  has_many :people, through: :visits
  has_many :families, through: :people
  has_many :users, through: :visits
end
