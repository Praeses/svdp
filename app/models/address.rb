class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true


  class << self
    def search term
    end
  end
end
