require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/computer_player"
class ComputerPlayerTest < Minitest::Test

  def test_class_exists
    computer_player = ComputerPlayer.new
    assert computer_player.class == ComputerPlayer
  end

  def test_can_see_their_grid
    computer_player = ComputerPlayer.new
    assert_equal computer_player.get_my_grid.values, Array.new(4,Array.new(4))#[[nil,nil,nil,nil],[nil,nil,nil,nil],[nil,nil,nil,nil],[nil,nil,nil,nil]] #rows
  end

  def test_ship_cannot_wrap_horizontal
    computer_player = ComputerPlayer.new
    result = computer_player.place_ship("A4","A1",2) #need to specify 1st and last coord.
    assert_equal "Ship cannot wrap around!", result
  end

  def test_ship_cannot_wrap_vertical
    computer_player = ComputerPlayer.new
    result = computer_player.place_ship("D1","A1",2) #need to specify 1st and last coord.
    assert_equal "Ship cannot wrap around!", result
  end

  # def test_ship_cannot_overlap
  #   computer_player = ComputerPlayer.new
  #   result = computer_player.place_ship("A1","A2",2) #need to specify 1st and last coord.
  #   result = computer_player.place_ship("A1","B1",2)
  #   assert_equal result, "Ship cannot overlap, already has a ship"
  # end

  def test_place_ship_legally
    computer_player = ComputerPlayer.new
    result = computer_player.place_ship("A1","A2",2)
    assert result
    grid = computer_player.get_my_grid
    assert_equal 2, grid["A"][0].size#grid[row][column]
    assert_equal 2, grid["A"][1].size#grid[row][column]
  end
end
