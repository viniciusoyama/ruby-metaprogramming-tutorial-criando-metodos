class Person
  include Comparable

  attr_accessor :name
  attr_accessor :email
  attr_accessor :weight
  attr_accessor :father
  attr_accessor :mother
  attr_accessor :children
  attr_accessor :state
  attr_accessor :pets

  def initialize
    @pets = []
  end

  def <=>(other)
    name.<=>(other.name)
  end
end
