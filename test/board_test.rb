require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'


class BoardTest < Minitest::Test

  def test_creates_new_board
    board = Board.new

    assert board
  end

  def test_board_has_a_length_of_16
    test_board = Board.new

    assert_equal 16, test_board.array.length
  end

  def test_render
    test_board = Board.new

    assert  test_board.render
  end

  def test_add_to_history
    test_board = Board.new
    coordinate = 3

    test_board.add_to_history(coordinate)

    assert_equal [3], test_board.history
  end

  def test_add_to_history
      test_board = Board.new
      coordinate_1 = 3
      coordinate_2 = 7
      coordinate_3 = 8

      test_board.add_to_history(coordinate_1)
      test_board.add_to_history(coordinate_2)
      test_board.add_to_history(coordinate_3)

      assert_equal [3, 7, 8], test_board.history
  end

  def test_shot_before_returns_true_or_false
  test_board = Board.new
    coordinate_1 = 0
    coordinate_2 = 4
    coordinate_3 = 8
    coordinate_4 = 11

    test_board.add_to_history(coordinate_1)
    test_board.add_to_history(coordinate_2)
    test_board.add_to_history(coordinate_3)

    assert_equal true, test_board.shot_before?(coordinate_2)
    assert_equal false, test_board.shot_before?(coordinate_4)
  end

   def test_validate_shot_errors_non_board_coordinates
       test_board = Board.new
        coordinate_1 = -1

        assert_equal "Error - is not on the game board", test_board.validate_shot?(coordinate_1)
    end

    def test_validate_shot_errors_shot_before_coordinates
      test_board = Board.new
      coordinate_1 = 0
      coordinate_2 = 4
      coordinate_3 = 8
      coordinate_4 = 11

      test_board.add_to_history(coordinate_1)
      test_board.add_to_history(coordinate_2)
      test_board.add_to_history(coordinate_3)

      assert_equal "Error - has been fired already", test_board.validate_shot?(coordinate_1)
    end

    def test_add_ship_to_board
      board = Board.new
      ship_1 = Ship.new
      ship_2 = Ship.new
      coordinate_1 = 8
      coordinate_2 = 9
      coordinate_3 = 3
      coordinate_4 = 7

      ship_1.assign_coordinate(coordinate_1)
      ship_1.assign_coordinate(coordinate_2)
      ship_2.assign_coordinate(coordinate_3)
      ship_2.assign_coordinate(coordinate_4)

      board.add_ship_to_board(ship_1)
      board.add_ship_to_board(ship_2)

      assert_equal [ship_1, ship_2], board.ships
    end

    def test_make_ship_list_returns_array
       board = Board.new
      ship_1 = Ship.new

      coordinate_1 = 8
      coordinate_2 = 9
      ship_1.assign_coordinate(coordinate_1)
      ship_1.assign_coordinate(coordinate_2)

      board.add_ship_to_board(ship_1)

      assert_equal [8, 9], board.make_ship_list
    end

    def test_make_ship_list_returns_flatten_array
      board = Board.new
      ship_1 = Ship.new
      ship_2 = Ship.new
      coordinate_1 = 8
      coordinate_2 = 9
      coordinate_3 = 3
      coordinate_4 = 7

      ship_1.assign_coordinate(coordinate_1)
      ship_1.assign_coordinate(coordinate_2)
      ship_2.assign_coordinate(coordinate_3)
      ship_2.assign_coordinate(coordinate_4)

      board.add_ship_to_board(ship_1)
      board.add_ship_to_board(ship_2)

      assert_equal [8, 9, 3, 7], board.make_ship_list
    end

    def test_shot_in_ship_list
      board = Board.new
      ship_1 = Ship.new
      ship_2 = Ship.new
      coordinate_1 = 8
      coordinate_2 = 9
      coordinate_3 = 3
      coordinate_4 = 7

      ship_1.assign_coordinate(coordinate_1)
      ship_1.assign_coordinate(coordinate_2)
      ship_2.assign_coordinate(coordinate_3)
      ship_2.assign_coordinate(coordinate_4)

      board.add_ship_to_board(ship_1)
      board.add_ship_to_board(ship_2)

      board.make_ship_list

      shot_1 = 3
       shot_2 = 12

      assert_equal true, board.shot_in_ship_list?(shot_1)
      assert_equal false, board.shot_in_ship_list?(shot_2)

    end

    def test_writes_board
      board = Board.new
      ship_1 = Ship.new
      ship_2 = Ship.new
      coordinate_1 = 8
      coordinate_2 = 9
      coordinate_3 = 3
      coordinate_4 = 7

      ship_1.assign_coordinate(coordinate_1)
      ship_1.assign_coordinate(coordinate_2)
      ship_2.assign_coordinate(coordinate_3)
      ship_2.assign_coordinate(coordinate_4)

      board.add_ship_to_board(ship_1)
      board.add_ship_to_board(ship_2)

      shot_1 = 3
      shot_2 = 7
      shot_3 = 1

      board.add_to_history(shot_1)
      board.add_to_history(shot_2)
      board.add_to_history(shot_3)

      board.writes_board
     
     p board.array

     assert_equal ["", "M", "", "H", "", "", "", "H", "", "", "", "", "", "", "", ""], board.array

    end

    def test_render_board
      board = Board.new
      ship_1 = Ship.new
      ship_2 = Ship.new
      coordinate_1 = 8
      coordinate_2 = 9
      coordinate_3 = 3
      coordinate_4 = 7

      ship_1.assign_coordinate(coordinate_1)
      ship_1.assign_coordinate(coordinate_2)
      ship_2.assign_coordinate(coordinate_3)
      ship_2.assign_coordinate(coordinate_4)

      board.add_ship_to_board(ship_1)
      board.add_ship_to_board(ship_2)

      shot_1 = 3
      shot_2 = 7
      shot_3 = 1

      board.add_to_history(shot_1)
      board.add_to_history(shot_2)
      board.add_to_history(shot_3)

      board.writes_board
      board.render

      p board.render

     assert board.render

   end

end #class end