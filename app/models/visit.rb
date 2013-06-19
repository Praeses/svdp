class Visit < ActiveRecord::Base
  belongs_to :person

  attr_accessible :date_of_visit, :note, :person_id, :needs,
    :income, :skills, :action

  scope :with_person_id , ->(id)     { where person_id: id }
  scope :with_person    , ->(person) { with_person_id(persion.id) }

end
