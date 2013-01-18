class Visit < ActiveRecord::Base
  belongs_to :person

  attr_accessible :date_of_visit, :note, :person_id, :needs,
    :income, :skills, :action

  scope :with_person_id, lambda { |id| where :person_id => id }

end
