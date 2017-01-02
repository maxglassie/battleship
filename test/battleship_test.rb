require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'
require './lib/board'
require './lib/ship'

class BattleshipTest < Minitest::Test

  def test_initialize_boards
  battleship = Battleship.new
  assert battleship.player_board
  assert battleship.computer_board
end


end #class end