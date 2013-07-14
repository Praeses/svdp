module Result
  require 'result/address'
  require 'result/family'
  require 'result/person'

  def self.extended record
    record.extend "Result::#{record.class}".constantize
  end
end
