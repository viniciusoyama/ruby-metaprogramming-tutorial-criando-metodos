class PetBuilder
  def initialize
    @pet = Pet.new
  end

  def name(name)
    @pet.name = name
  end

  def type(type)
    @pet.type = type
  end

  def weight(weight)
    @pet.weight = weight
  end

  def get_instance
    @pet
  end
end
