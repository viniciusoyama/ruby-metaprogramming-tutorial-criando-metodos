class PersonBuilder
  def initialize
    @person = Person.new
  end

  def name(name)
    @person.name = name
  end

  def email(email)
    @person.email = email
  end

  def weight(weight)
    @person.weight = weight
  end

  def mother(mother)
    @person.mother = mother
  end

  def father(father)
    @person.father = father
  end

  def state(state)
    @person.state = state
  end

  def pet(pet)
    @person.pets << pet
  end

  def get_instance
    @person
  end
end
