class Member < ActiveRecord::Base
  belongs_to :person
  attr_accessible :dob, :first_name, :last_name, :male, :person_id
end
