require './lib/ship'

class Board 
  attr_reader :array, :history, :ships, :ship_list

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

# thinking - ship sunk checks the ships on a board 
# to see if they are sunk
# should it return a ship? i don't like that
# what do I want? I want to know if a ship is sunk
# i also want to set the ship to being sunk, so i can check
# and see if all the ships on a board are sunk, to end the game
# 
# 
# 

def sank_a_ship?
  if_ship_sunk_set_ship_to_sunk
  @ships.any? do |ship|
      ship.sunk?
      end
  end

def if_ship_sunk_set_ship_to_sunk
    @ships.each do |ship|
      if ship_sunk?(ship) 
        ship.sink_ship
      end
    end
  end

  def ship_sunk?(ship)
      ship.location.all? do |coordinate|
        ship_coordinates_in_shot_list?(coordinate)
      end
  end

  def ship_coordinates_in_shot_list?(shot)
    @history.any? do |location|
        shot == location
      end
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
      end
  end

  def validate_shot?(coordinate)
    if on_board?(coordinate)
      "Error - is not on the board"
    elsif shot_before?(coordinate)
      "Error - has been fired already"
    else
      true
    end
  end

  def add_ship_to_board(ship)
    if ship.horizontal_or_vertical_position? && !ships_overlap?(ship)
      @ships << ship
      make_ship_list
    else
      "Error - ship in invalid position or overlaps other ship"
    end
  end

  def ships_overlap?(ship)
    ship.location.any? do |coordinate|
      shot_in_ship_list?(coordinate)
    end
  end

  def make_two_unit_ship(coordinate_1, coordinate_2)
    if two_unit_ship_valid_coordinates?(coordinate_1, coordinate_2)
      two_unit_ship = Ship.new
      two_unit_ship.assign_coordinate(coordinate_1)
      two_unit_ship.assign_coordinate(coordinate_2)
    else
    "Error - coordinates are not contiguous"
    end
    return two_unit_ship
  end

  def make_three_unit_ship(coordinate_1, coordinate_2)
      if three_unit_ship_valid_coordinates?(coordinate_1, coordinate_2)
        middle = fill_in_coordinates(coordinate_1,coordinate_2)
      three_unit_ship = Ship.new
      three_unit_ship.assign_coordinate(coordinate_1)
      three_unit_ship.assign_coordinate(middle)
      three_unit_ship.assign_coordinate(coordinate_2)
      else
      "Error - coordinates are not contiguous"
      end
      return three_unit_ship
  end

  def two_unit_ship_valid_coordinates?(coordinate_1, coordinate_2)
      x = (coordinate_1 - coordinate_2).abs
      if (x == 1) || (x == 4)
        return true
      else false
      end
  end

  def three_unit_ship_valid_coordinates?(coordinate_1, coordinate_2)
      x = (coordinate_1 - coordinate_2).abs
      if (x == 2) || (x == 8)
        return true
      else false
      end
  end

  def fill_in_coordinates(coordinate_1, coordinate_2)
    x = (coordinate_1 - coordinate_2).abs
      if x == 8
        coordinate_1 + 4
      elsif x == 2
        coordinate_1 + 1
      else 
        "Error - not contiguous coordinates"
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

  def make_ship_list
    @ship_list = @ships.map do |ship|
        ship.location
    end.flatten
  end

end #class end