class Ship
  attr_reader :location

  def initialize
    @location = []
    @sunk = false
  end

  def assign_coordinate(coordinate)
    @location << coordinate
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

  def on_ship?(coordinate)
    if @location.include?(coordinate)
      true
    else
      false
    end
  end

  def in_row?
    # require 'pry'; binding.pry
    if in_first_row?
      true
    elsif in_second_row?
      true
    elsif in_third_row?
      true
    elsif in_fourth_row?
      true
    else
      return false
    end
  end

  def in_column?
    if in_first_column?
      true
    elsif in_second_column?
      true
    elsif in_third_column?
      true
    elsif in_fourth_column?
      true
    else
      return false
    end
  end

  def first_row
    [0,1, 2, 3]
  end

  def second_row 
    [4, 5, 6, 7]
  end

  def third_row
    [8, 9, 10, 11]
  end

  def fourth_row
    [12, 13, 14, 15]
  end

  def in_first_row?
    @location.all? do |coordinate|
      first_row.include?(coordinate)
     end
  end

  def in_second_row?
    @location.all? do |coordinate|
      second_row.include?(coordinate)
     end
  end

  def in_third_row?
    @location.all? do |coordinate|
      third_row.include?(coordinate)
     end
  end

  def in_fourth_row?
    @location.all? do |coordinate|
      fourth_row.include?(coordinate)
     end
  end

  def first_column
    [0, 4, 8, 12]
  end

  def second_column 
    [1, 5, 9, 13]
  end

  def third_column
    [2, 6, 10, 14]
  end

  def fourth_column
    [3, 7, 11, 15]
  end

  def in_first_column?
    @location.all? do |coordinate|
      first_column.include?(coordinate)
     end
  end

  def in_second_column?
    @location.all? do |coordinate|
      second_column.include?(coordinate)
     end
  end

  def in_third_column?
    @location.all? do |coordinate|
      third_column.include?(coordinate)
     end
  end

  def in_fourth_column?
    @location.all? do |coordinate|
      fourth_column.include?(coordinate)
     end
  end

end