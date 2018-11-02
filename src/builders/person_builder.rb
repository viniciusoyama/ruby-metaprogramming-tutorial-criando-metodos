require_relative 'base_builder'

class PersonBuilder < BaseBuilder
  def name(name)
    get_instance.name = name
  end

  def email(email)
    get_instance.email = email
  end

  def weight(weight)
    get_instance.weight = weight
  end

  def mother(mother)
    get_instance.mother = mother
  end

  def father(father)
    get_instance.father = father
  end

  def state(state)
    get_instance.state = state
  end

  def pet(pet)
    get_instance.pets << pet
  end
end
