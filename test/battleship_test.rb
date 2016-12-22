
require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/battleship"
class BattleshipTest < Minitest::Test

  def test_class_exists
    battleship = Battleship.new
  end

  def test_can_translate_input_to_coordinates
  end

  def test_can_print_instructions_to_screen_after_prompt
    battleship = Battleship.new
  end

  def test_can_respond_to_invalid_selection
    battleship = Battleship.new
  end
end
