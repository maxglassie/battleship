require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/board'

class ShipTest < Minitest::Test

  def test_can_create_ship
    ship = Ship.new

    assert ship
  end

  def test_ship_can_assign_coordinates
    ship = Ship.new
    coordinate_0 = 0
    coordinate_1 = 1
    coordinate_2 = 2

    ship.assign_coordinate(coordinate_0)
    ship.assign_coordinate(coordinate_1)
    ship.assign_coordinate(coordinate_2)

    assert_equal [0,1,2], ship.location
  end

  def test_on_ship?
    ship = Ship.new
    coordinate_0 = 0
    coordinate_1 = 1

    ship.assign_coordinate(coordinate_0)

    assert_equal true, ship.on_ship?(coordinate_0)
    assert_equal false, ship.on_ship?(coordinate_1)
  end

  def test_in_first_row_returns_true
    ship = Ship.new
    coordinate_0 = 0
    coordinate_1 = 1
    coordinate_2 = 2

    ship.assign_coordinate(coordinate_0)
    ship.assign_coordinate(coordinate_1)
    ship.assign_coordinate(coordinate_2)

    assert_equal true, ship.in_first_row?
  end

  def test_in_first_row_returns_false
    ship = Ship.new
    coordinate_0 = 2
    coordinate_1 = 5
    coordinate_2 = 6

    ship.assign_coordinate(coordinate_0)
    ship.assign_coordinate(coordinate_1)
    ship.assign_coordinate(coordinate_2)

    assert_equal false, ship.in_first_row?
  end

  def test_in_row_returns_true
    ship = Ship.new
    coordinate_0 = 8
    coordinate_1 = 9
    coordinate_2 = 10

    ship.assign_coordinate(coordinate_0)
    ship.assign_coordinate(coordinate_1)
    ship.assign_coordinate(coordinate_2)
    
    assert_equal true, ship.in_row?
  end

  def test_in_row_returns_false
    ship = Ship.new
    coordinate_0 = 4
    coordinate_1 = 9
    coordinate_2 = 10

    ship.assign_coordinate(coordinate_0)
    ship.assign_coordinate(coordinate_1)
    ship.assign_coordinate(coordinate_2)
    
    assert_equal false, ship.in_row?
  end

def test_in_column_returns_true
    ship = Ship.new
    coordinate_0 = 5
    coordinate_1 = 9
    coordinate_2 = 13

    ship.assign_coordinate(coordinate_0)
    ship.assign_coordinate(coordinate_1)
    ship.assign_coordinate(coordinate_2)
    
    assert_equal true, ship.in_column?
  end

  def test_in_column_returns_false_for_row
    ship = Ship.new
    coordinate_0 = 8
    coordinate_1 = 9
    coordinate_2 = 10

    ship.assign_coordinate(coordinate_0)
    ship.assign_coordinate(coordinate_1)
    ship.assign_coordinate(coordinate_2)

    assert_equal false, ship.in_column?
  end

  def test_ship_first_coordinate
    ship = Ship.new
    coordinate_0 = 8
    coordinate_1 = 9
    coordinate_2 = 10

    ship.assign_coordinate(coordinate_0)
    ship.assign_coordinate(coordinate_1)
    ship.assign_coordinate(coordinate_2)

    ship.first_first_coordinate
  end

end #class end