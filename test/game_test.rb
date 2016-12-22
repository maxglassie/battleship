require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/board'
require './lib/ship'

class GameTest < Minitest::Test

def test_initialize_boards
  game = Game.new
  assert game.player_board
  assert game.computer_board
end

def test_two_unit__ship_valid_coordinates_returns_false
  game = Game.new
  coordinate_1 = 1
  coordinate_2 = 3

  assert_equal false, game.two_unit_ship_valid_coordinates?(coordinate_1, coordinate_2)
end

def test_three_unit_ship_valid_coordinates_returns_true
  game = Game.new
  coordinate_1 = 3
  coordinate_2 = 11

  assert_equal true, game.three_unit_ship_valid_coordinates?(coordinate_1, coordinate_2)
end

def test_three_unit_ship_valid_coordinates_returns_false
  game = Game.new
  coordinate_1 = 3
  coordinate_2 = 10

  assert_equal false, game.three_unit_ship_valid_coordinates?(coordinate_1, coordinate_2)
end

def test_fill_in_coordinates_returns_middle
  game = Game.new
  coordinate_1 = 7
  coordinate_2 = 15

  assert_equal 11, game.fill_in_coordinates(coordinate_1, coordinate_2)
end

def test_fill_in_coordinates_returns_error
  game = Game.new
  coordinate_1 = 7
  coordinate_2 = 11

  assert_equal "Error - not contiguous coordinates", game.fill_in_coordinates(coordinate_1, coordinate_2)
end

def test_ship_in_horizontal_or_vertical_position?
  game = Game.new
  ship = Ship.new
  coordinate_0 = 6
  coordinate_1 = 7
  coordinate_2 = 8

  ship.assign_coordinate(coordinate_0)
  ship.assign_coordinate(coordinate_1)
  ship.assign_coordinate(coordinate_2)

  assert_equal false, game.ship_horizontal_or_vertical_position?(ship)
end

def test_make_two_unit_ship
    game = Game.new
    coordinate_1 = 4
    coordinate_2 = 8
    ship = Ship.new

    assert_equal ship.class, game.make_two_unit_ship(coordinate_1, coordinate_2).class
end

def test_make_three_unit_ship
    game = Game.new
    coordinate_1 = 4
    coordinate_2 = 12
    ship = Ship.new

    assert_equal ship.class, game.make_three_unit_ship(coordinate_1, coordinate_2).class
end

def test_add_ship_to_board
    game = Game.new
    coordinate_1 = 4
    coordinate_2 = 12

    ship = game.make_three_unit_ship(coordinate_1, coordinate_2)
    
    game.add_ship_to_board(ship, game.player_board)

    assert_equal ship, game.player_board.ships
end

end #class end