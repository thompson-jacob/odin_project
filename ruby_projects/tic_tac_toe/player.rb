require_relative "board.rb"

class Player 
  
  attr_accessor :name, :symbol

    def initialize(name = nil, symbol=nil)
      @name = name
      @symbol = symbol
    end


end

class ComputerPlayer < Player
  def initialize(symbol)
    super("Computer", symbol)
  end

  def computer_pick(board_array)
    current_options = board_array.select { |i| i.is_a?(Integer) }
    
    current_options.sample

    # TODO: random position by computer to start


    # Check for winning and blocking moves
    # corner trap and corner trap defense?
    # randomize positions with the center and corners taking precedence
  end


end