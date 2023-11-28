require_relative "board.rb"

class Player 
  
  attr_accessor :name, :symbol

    def initialize(name = nil, symbol=nil)
      @name = name
      @symbol = symbol
    end


end

class ComputerPlayer < Player
  def initialize(name="Computer",symbol)
    super(name, symbol)
  end

  def computer_pick(board_array, current_win_lines)
    symbols = ["X","O"]
    opp_symbol = (symbols - [symbol]).first
    current_options = board_array.select { |i| i.is_a?(Integer) }
  
    current_win_lines.each do |line| 
      #Check for single integer left in available places to win
      if line.count { |i| i.is_a?(Integer)} == 1 && line.count(symbol) == 2 
        if empty_spot = line.find { |i| i.is_a?(Integer) }
          return empty_spot + 1
        end
      end
    end

  current_win_lines.each do |line|
      # Check for single integer left in available places to block opponent win
    if line.count { |i| i.is_a?(Integer)} == 1 && line.count(opp_symbol) == 2 
      if empty_spot = line.find { |i| i.is_a?(Integer) }
        return empty_spot + 1
      end
    end
  end
    #Choose from optimal corner and center positions, choose randomly if unavailable
    corners_and_middle = current_options - [2,4,6,8]
    current_options = corners_and_middle unless corners_and_middle.empty?
    current_options.sample 
  end
end
