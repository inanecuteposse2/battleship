class Ship
  attr_reader :size, :hits
  def initialize(size)
    @size = size
    @hits = 0
  end

  def take_hit
    @hits +=1
  end

  def sunk?
    @hits >= @size
  end
end
