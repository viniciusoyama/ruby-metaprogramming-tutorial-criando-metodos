require_relative 'base_builder'

class PetBuilder < BaseBuilder
  assignable_entity_attribute :name
  assignable_entity_attribute :type
  assignable_entity_attribute :weight
end
