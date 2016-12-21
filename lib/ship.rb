class Ship
  attr_reader :location

  def initialize
    @location = []
    @sunk = false
  end

  def assign_coordinate(coordinate)
    #logic for rejecting coordinates if violate horiz / vert
    @location << coordinate
  end

  def on_ship?(coordinate)
    if @location.include?(coordinate)
      true
    else
      false
    end
  end

  # def create_location(start, end)

  # end

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

  def in_column?
    # require 'pry'; binding.pry
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

  #Math.sqrt(16)
  #pass the length arg to a ship 
  #need to create a ship given two coordinates
  #predicate for ship type - destroyer, etc - 
  #what kind of ship are you?

 # row could check the difference between the coordinates
end