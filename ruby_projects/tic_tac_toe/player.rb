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
    current_options = board_array.select { |i| i.is_a?(Integer) }
    # # board_array [1,2,'X,'O',5,'O,'X',8,'X']
    # win_lines = [
    #   [0,1,2], [3,4,5], [6,7,8],
    #   [0,3,6], [1,4,7], [2,5,8],
    #   [0,4,8], [2,4,6]
    # ]
    # current_win_lines [["O", 1, "X"], ["O", 4, "X"], ["X", 7, "O"], ["O", "O", "X"], [1, 4, 7], ["X", "X", "O"], ["O", 4, "O"], ["X", 4, "X"]]
   

    # Check for winning and blocking moves
   
    current_win_lines.each do |line|
      #If only one integer position is left, 
      if line.count { |i| i.is_a?(Integer)} == 1 && line.count(symbol) == 2 
        empty_spot = line.find { |i| i.is_a?(Integer) }
        return empty_spot
        # TODO: figure out why computer is able to override human picks, finish win line logic for computer, defense line for computer and then randomize picks focusing on center and corners
      end
    end

    #random choice
    current_options.sample
    
    # corner trap and corner trap defense?
    # randomize positions with the center and corners taking precedence
  end


end