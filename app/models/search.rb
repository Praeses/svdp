class Search < ActiveRecord::Base

  def threads
    @threads ||= []
  end

  def results
    @results ||= {}
  end

  def klasses
    [Family,Address,Person]
  end

  def call
    klasses.map {|model| search_klass model }
    threads.each(&:join)
    results
  end

  def search_klass model
    threads << Thread.new do
      ActiveRecord::Base.connection_pool.with_connection do
        results[model] = model.search(term)
      end
    end
  end

end
