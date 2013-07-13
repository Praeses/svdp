class Search < ActiveRecord::Base

  def results
    @results ||= {}
  end

  def klasses
    [Family,Address,Person]
  end

  def call
    klasses.each {|model| search_klass model } and results
  end

  def search_klass model
    results[model] = model.search(term)
  end

end
