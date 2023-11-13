
class Player 
  
  attr_accessor :name, :symbol

    def initialize(name = nil, symbol)
      @name = name
      @symbol = symbol
    end

    # If players want another game, swap symbol between P1 and P2
end