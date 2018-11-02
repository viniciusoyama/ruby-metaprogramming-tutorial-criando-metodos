require_relative 'builders/person_builder'
require_relative 'builders/pet_builder'
require_relative 'builders/state_builder'

require_relative 'entities/person'
require_relative 'entities/pet'
require_relative 'entities/state'

class DSLEvaluator
  class World
    attr_reader :persons
    attr_reader :pets
    attr_reader :states

    def initialize
      @persons = {}
      @pets = {}
      @states = {}
    end

    def person(name, &block)
      builder = PersonBuilder.new
      builder.instance_eval(&block)

      person = builder.get_instance
      person.name = name
      @persons[name] = person
    end

    def pet(name, &block)
      builder = PetBuilder.new
      builder.instance_eval(&block)

      pet = builder.get_instance
      pet.name = name
      @pets[name] = pet
    end

    def state(abbreviation, &block)
      builder = StateBuilder.new
      builder.instance_eval(&block)

      state = builder.get_instance
      state.abbreviation = abbreviation
      @states[abbreviation] = state
    end
  end

  def self.evaluate(&block)
    world = World.new

    world.instance_eval(&block)

    world.persons.each_pair do |_, person|
      person.mother = world.persons[person.mother]
      person.father = world.persons[person.father]
      person.state = world.states[person.state]
      person.pets = world.pets.values.select { |pet| person.pets.include?(pet.name) }
    end

    {
      "persons" => world.persons,
      "states" => world.states,
      "pets" => world.pets
    }
  end
end
