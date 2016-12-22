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

    def add_ship_to_board(ship, board)
      if ship_horizontal_or_vertical_position?(ship) && !ships_overlap?(ship, board)
      board.add_ship(ship)
      else
        "Error - ship in invalid position or overlap other ship"
      end
    end

   def ships_overlap?(ship, board)
      if board.shot_in_ship_list?(coordinate_1) || board.shot_in_ship_list?(coordinate_2)
          true
      else
          false
      end
    end

    def ship_horizontal_or_vertical_position?(ship)
      if ship.in_row? 
        true
      elsif ship.in_column?
        true
      else
        false
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