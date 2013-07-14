module Result::Person
  extend Forwardable

  def_delegator :family, :people
  def_delegator :family, :primay_address
  def_delegator :family, :addresses
  def_delegator :family, :name
  def_delegator :family, :case_files

end
