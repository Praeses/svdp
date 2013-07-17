class Search < ActiveRecord::Base

  def klasses
    [ Family, Person, Address, CaseFile ]
  end

  def call
    klasses.map do |model|
      model.basic_search(term).map(&:to_family)
    end.flatten.uniq
  end

end
