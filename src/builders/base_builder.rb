class BaseBuilder
  def initialize
    @entity = self.class.get_entity_class_name.new
  end

  def get_instance
    @entity
  end

  def self.get_entity_class_name
    raise 'Implement on children'
  end
end
