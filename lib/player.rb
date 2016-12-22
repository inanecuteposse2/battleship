require "./lib/ship"
module Player #this will be mixed into a class
  def initialize
    @grid_mine = {}#{"A"=>Array.new(4),"B"=>Array.new(4)}#these are empty grids
    "A".upto("D") do |row_letter|
      @grid_mine[row_letter] = Array.new(4)
      #for this row_letter give it an array with 4 spots
    end

    @grid_opponent = {}
    "A".upto("D") do |row_letter|
      @grid_opponent[row_letter] = Array.new(4)
    end
  end

  def get_my_grid
    @grid_mine
  end

  def place_ship(start, finish, size)
    start_row = start[0]
    start_column = start[1].to_i-1#column number
    finish_row = finish[0]
    finish_column = finish[1].to_i-1#column number
    if start_column > finish_column or
      start_row > finish_row
      return "Ship cannot wrap around!"
    end
    ship = Ship.new(size)
    @grid_mine[finish_row][finish_column]= ship
    @grid_mine[start_row][start_column]= ship
  end
end
