require_relative 'base_builder'

class StateBuilder < BaseBuilder
  assignable_entity_attribute :name
  assignable_entity_attribute :abbreviation
  assignable_entity_attribute :size_in_square_meters
end
