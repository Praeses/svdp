class Search < ActiveRecord::Base

  def klasses
    [ Family, Person, Address, CaseFile ]
  end

  def call
    (main + extras).uniq
  end

  def main
    klasses.map do |model|
      model.basic_search(term).map(&:to_family)
    end.flatten.uniq
  end

  def extras
    CaseFile.where(number: term.to_i).map(&:to_family)
  end

end
