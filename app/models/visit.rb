class Visit < ActiveRecord::Base
  belongs_to :person
  attr_accessible :date_of_visit, :note

  scope :with_person_id, lambda { |id| where :person_id => id }

end
