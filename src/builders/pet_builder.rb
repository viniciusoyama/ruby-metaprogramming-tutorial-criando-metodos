require_relative 'base_builder'

class PetBuilder < BaseBuilder
  def name(name)
    get_instance.name = name
  end

  def type(type)
    get_instance.type = type
  end

  def weight(weight)
    get_instance.weight = weight
  end
end
