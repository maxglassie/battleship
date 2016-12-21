require './lib/ship'

class Board 
  attr_reader :array, :history, :ships

  def initialize
    @array = [
     "", "", "", "",
      "", "", "", "",
      "", "", "", "",
      "", "", "", ""
    ]
    @history = []
    @ships = []
    @ship_list = []
  end

  def render
". 1  2  3  4 \n
A  #{@array[0]} #{@array[1]} #{@array[2]} #{@array[3]} \n
B  #{@array[4]} #{@array[5]} #{@array[6]} #{@array[7]} \n
C  #{@array[8]} #{@array[9]} #{@array[10]} #{@array[11]} \n
D  #{@array[12]} #{@array[13]} #{@array[14]} #{@array[15]} \n
"
  end

  def writes_board
    make_ship_list
    @history.each do |shot|
      if shot_in_ship_list?(shot)
        @array[shot] = "H"
      else
        @array[shot] = "M"
      end
    end
  end

    def shot_in_ship_list?(shot)
        @ship_list.any? do |location|
          shot == location
          # require 'pry'; binding.pry
        end
    end

  def validate_shot?(coordinate)
    if on_board?(coordinate)
      "Error - is not on the game board"
    elsif shot_before?(coordinate)
      "Error - has been fired already"
    else
      true
    end
  end

  def add_to_history(coordinate) #skidoosh
    @history << coordinate
  end

  def shot_before?(coordinate) #skidoosh
    @history.any? do |element|
      element == coordinate
    end
  end

  def on_board?(coordinate) #skidoosh
    if (coordinate < 0) or (coordinate > array.length - 1)
      true
    else
      false
    end
  end

  def add_ship_to_board(ship)
    @ships << ship
  end

  def make_ship_list
    @ship_list = @ships.map do |ship|
        ship.location
    end.flatten
  end




end #class end

# board = Board.new
# ship_1 = Ship.new
# ship_2 = Ship.new
# coordinate_1 = 8
# coordinate_2 = 9
# coordinate_3 = 3
# coordinate_4 = 7

# ship_1.assign_coordinate(coordinate_1)
# ship_1.assign_coordinate(coordinate_2)
# ship_2.assign_coordinate(coordinate_3)
# ship_2.assign_coordinate(coordinate_4)

# board.add_ship_to_board(ship_1)
# board.add_ship_to_board(ship_2)

# shot_1 = 3
# shot_2 = 7
# shot_3 = 1

# board.add_to_history(shot_1)
# board.add_to_history(shot_2)
# board.add_to_history(shot_3)

# board.writes_board
# puts board.render