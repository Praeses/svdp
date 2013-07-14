class Search < ActiveRecord::Base

  def klasses
    [Family,Address,Person]
  end

  def call
    klasses.map {|model| model.search(term) }.flatten
  end

end
