require_relative 'base_builder'

class StateBuilder < BaseBuilder
  def name(name)
    get_instance.name = name
  end

  def type(type)
    get_instance.type = type
  end

  def weight(weight)
    get_instance.weight = weight
  end

  def size_in_square_meters(size_in_square_meters)
    get_instance.size_in_square_meters = size_in_square_meters
  end

end
