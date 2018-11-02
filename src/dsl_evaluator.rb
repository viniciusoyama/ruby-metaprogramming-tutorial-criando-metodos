require_relative 'person'

class DSLEvaluator
  class World
    attr_reader :persons

    def initialize
      @persons = {}
    end

    def person(name, &block)
      builder = PersonBuilder.new
      builder.instance_eval(&block)

      person = builder.get_instance
      person.name = name
      @persons[name] = person
    end
  end

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

    def get_instance
      @person
    end
  end

  def self.evaluate(&block)
    world = World.new

    world.instance_eval(&block)

    world.persons.each_pair do |_, person|
      person.mother = world.persons[person.mother]
      person.father = world.persons[person.father]
    end

    world.persons
  end
end
