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

end #class end