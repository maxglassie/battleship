require './lib/board'
require './lib/ship'
require './lib/message'

class Battleship
  include Message

  attr_reader :player_board, :computer_board

  def initialize 
    @player_board = Board.new
    @computer_board = Board.new
  end

    def translator_hash
     {
      "A1" => 0,
      "A2" => 1,
      "A3" => 2,
      "A4" => 3,
      "B1" => 4,
      "B2" => 5,
      "B3" => 6,
      "B4" => 7,
      "C1" => 8,
      "C2" => 9,
      "C3" => 10,
      "C4" => 11,
      "D1" => 12,
      "D2" => 13,
      "D3" => 14,
      "D4" => 15
    }
  end

  def translate(coordinate)
    #need to include option for a shot that 
    # isn't included in the tranlsator hash - error?
    translator_hash[coordinate]
  end

  def start_game
    Message.welcome_message
    input = gets.chomp.upcase

    if input == "P"
      computer_ship_sequence
    elsif input == "Q"
      quit_game
    else input == "I"
      Message.instructions
      start_game
    end
  end

  def computer_ship_sequence
    coordinate_1 = 4
    coordinate_2 = 5
    coordinate_3 = 3
    coordinate_4 = 11

    ship_1 = @computer_board.make_two_unit_ship(coordinate_1, coordinate_2)
    ship_2 = @computer_board.make_three_unit_ship(coordinate_3, coordinate_4)
    
    @computer_board.add_ship_to_board(ship_1)
    @computer_board.add_ship_to_board(ship_2)
    
    Message.computer_has_placed_ships
    player_ship_sequence_two_unit_ship
  end

  def player_ship_sequence_two_unit_ship
    input = gets.chomp.upcase

    to_be_translated = input.split
    
    coordinate_1 = translate(to_be_translated[0])
    coordinate_2 = translate(to_be_translated[-1])

    ship_1 = @player_board.make_two_unit_ship(coordinate_1, coordinate_2)
    
    @player_board.add_ship_to_board(ship_1)
    player_ship_sequence_three_unit_ship

  end

   def player_ship_sequence_three_unit_ship
    Message.player_place_three_unit_ship
    input = gets.chomp.upcase

    to_be_translated = input.split
    coordinate_1 = translate(to_be_translated[0])
    coordinate_2 = translate(to_be_translated[-1])

    ship_2 = @player_board.make_three_unit_ship(coordinate_1, coordinate_2)
    @player_board.add_ship_to_board(ship_2)
    player_shot_sequence
  end

  def player_shot_sequence
    Message.player_shot

    input = gets.chomp.upcase
    to_be_translated = input
    coordinate = translate(to_be_translated)

    if @computer_board.on_board?(coordinate)
      "You missed the board! Try again."
      player_shot_sequence
    elsif @computer_board.shot_before?(coordinate)
      "You've already fired at this location. Try again."
      player_shot_sequence
    elsif @computer_board.shot_in_ship_list?(coordinate)
      @computer_board.add_to_history(coordinate)
      Message.shot_hit
      @computer_board.writes_board
      puts @computer_board.render

    else
      @computer_board.add_to_history(coordinate)
      Message.shot_miss
      #
    end
    # checks if ships are sunk
    # passes argument to computer_shot_sequence
  end

  def computer_shot_sequence
    #puts Messages.
    #computer_takes_random_shot
    #calls player_shot_sequence - loops until all_ships_sunk?
  end

  def quit_game
    abort("Goodbye")
  end

  # def ai_ship_generator
  #   #between 0 - 15, generate rand coordinate
  #   #coordinate = x
  #   #rand choose to x add 1
  #   #or x add 4
  #   #or add 2
  #   #or add 8
  # end

end

game = Battleship.new
game.start_game