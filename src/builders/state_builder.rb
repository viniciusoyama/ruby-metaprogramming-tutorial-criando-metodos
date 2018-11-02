class StateBuilder
  def initialize
    @state = State.new
  end

  def name(name)
    @state.name = name
  end

  def type(type)
    @state.type = type
  end

  def weight(weight)
    @state.weight = weight
  end

  def size_in_square_meters(size_in_square_meters)
    @state.size_in_square_meters = size_in_square_meters
  end

  def get_instance
    @state
  end
end
