require "./lib/computer_player"
class Battleship

  def initialize
    welcome
  end

  def welcome
    puts "Welcome to BATTLESHIP"
    puts "Would you like to (p)lay, read the (i)nstructions or (q)uit?"
    player_input = gets.chomp.to_s.upcase
    start_game_sequence_input(player_input)
  end

  def start_game_next_step
    puts "Would you like to (p)lay or (q)uit?"
    player_input = gets.chomp.to_s.upcase
    start_game_sequence_input(player_input)
  end

  def instructions
    puts "The computer will randomly place a two-unit and three-unit boat on a 4x4 grid.  You should follow suit.  When it is your turn you will guess the row and column where you believe the computer has placed its ships.  If your guess is correct the board will display a hit (H).  If your guess is incorrect the board will display a miss (M).  If you hit each spot on the ship, then the ship has been sunk.  Once you sink all the ships, you are the winner of the game!"
    puts "Press enter to continue"
    player_input = gets.chomp.to_s.upcase
  end

  def players_placement
    @computer = ComputerPlayer.new
    @computer.place_ships
    puts "I have laid out my ships on the grid.  It is necessary for you to now layout yours.  The first ship is two units long and the second is three units long.  The grid has A1 at the top left and D4 at the bottom right. Enter the squares for the two-unit ship:"
    player_input = gets.chomp.to_s.upcase
    @human = HumanPlayer.new
    @human.place_ship(player_input, 2)
    puts "Please enter the squares for the three unit ship."
    player_input = gets.chomp.to_s.upcase
    @human.place_ship(player_input, 3)
  end

  def play_game
    @human.display_opponent_grid
    puts "Enter position"
    player_input = gets.chomp.to_s.upcase
    result = @computer.receive_shot(player_input)#make method in computer_player.rb or player.rb(module)
    puts result
    @human.record_result(player_input, result) #make method in human player file or player.rb(module)
    if result == "Game Over"
      end_game_sequence("You Won!!")
      return
    end
    @computer.display_opponent_grid
    shot_input = @computer.get_shot
    result = @human.receive_shot(shot_input)
    puts result
    @computer.record_result(shot_input, result)
    if result == "Game Over"
      end_game_sequence("I Won!!")
      return
    end
    play_game #recursive
  end

  def end_game_sequence(message)
    puts message
  end

  def start_game_sequence_input(player_input)
    if player_input == "P"
      players_placement
      play_game
    elsif player_input == "I"
      instructions
      start_game_next_step
    elsif player_input == "Q"
      puts "See Ya"
      exit
    else
      puts "invalid"
      puts "Would you like to (p)lay, read the (i)nstructions or (q)uit?"
      player_input = gets.chomp.to_s.upcase
      start_game_sequence_input(player_input)
    end
  end
end
