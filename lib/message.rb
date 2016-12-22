module Message

  def self.welcome_message
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.instructions
    puts "Players place their ships on the board. They cannot see their 
    opponents board. \n
    Players alternate taking shots at their opponents board. If it is a hit,
    the player calls the hit. If a miss, they call the miss. \n
    Players take turns until their ships or their opponents ships are sunk.
    A ship is sunk when all of the locations of the ship have been hit."
  end

  def self.computer_has_placed_ships
      puts "I have laid out my ships on the grid. \n
      You now need to layout your two ships. \n 
      The first is two units long and the \n
      second is three units long. \n
      The grid has A1 at the top left and D4 at the bottom right. \n
      \n
      Enter the squares for the two-unit ship:
      (for example - A1 A2)"
  end

  def self.player_place_three_unit_ship
      puts "Please place a three unit ship. Place them using  \n
      the first and last coordinates. \n
      (for example - A1 A3)"
  end

  def self.player_shot
    puts "Please enter a coordinate for your shot:"
  end

  def self.shot_hit
    puts "Hit!"
  end

  def self.shot_miss
    puts "Miss!"
  end

  def self.computer_shot
    puts "The computer fired at #{coordinate}."
  end

end