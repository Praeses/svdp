class Search < ActiveRecord::Base

  def klasses
    # TODO: Add Address back in when we can figure out how to get the
    # family id from it
    { id: [ Family ], family_id: [Person] }
  end

  def call
    Family.where id: family_ids
  end


  def family_ids
    klasses.map do |field, models|
      models.map{ |model| model.search(term).pluck(field) }
    end.flatten
  end

end
