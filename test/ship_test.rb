require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/ship"
class ShipTest < Minitest::Test

  def test_class_exists
  ship= Ship.new(2)
  assert ship.class == Ship
  end

  def test_knows_its_size
    ship = Ship.new(2)
    assert ship.size == 2
  end

  def test_when_ship_starts_out_has_no_hits
    ship = Ship.new(2)
    assert ship.hits == 0
  end

  def test_ship_can_take_a_hit
    ship = Ship.new(2)
    ship.take_hit
    assert ship.hits == 1
  end

  def test_ship_can_be_sunk
    ship = Ship.new(2)
    ship.take_hit
    ship.take_hit
    assert ship.sunk?
  end
end
