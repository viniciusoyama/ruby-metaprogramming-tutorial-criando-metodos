require_relative 'base_builder'

class PersonBuilder < BaseBuilder
  assignable_entity_attribute :name
  assignable_entity_attribute :email
  assignable_entity_attribute :weight
  assignable_entity_attribute :mother
  assignable_entity_attribute :father
  assignable_entity_attribute :state

  def pet(pet)
    get_instance.pets << pet
  end
end
