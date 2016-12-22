require './lib/board'
require './lib/ship'

class Game
  attr_reader :player_board, :computer_board

  def initialize 
    @player_board = Board.new
    @computer_board = Board.new
  end

  def welcome
    puts Message.welcome

  # def ai_ship_generator
  #   #between 0 - 15, generate rand coordinate
  #   #coordinate = x
  #   #rand choose to x add 1
  #   #or x add 4
  #   #or add 2
  #   #or add 8
  # end

end