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
    pp board_array
    pp current_win_lines
  
    # # board_array [1,2,'X,'O',5,'O,'X',8,'X']
    # win_lines = [
    #   [0,1,2], [3,4,5], [6,7,8],
    #   [0,3,6], [1,4,7], [2,5,8],
    #   [0,4,8], [2,4,6]
    # ]
    # current_win_lines [["O", 1, "X"], ["O", 4, "X"], ["X", 7, "O"], ["O", "O", "X"], [1, 4, 7], ["X", "X", "O"], ["O", 4, "O"], ["X", 4, "X"]]

    # Check for winning and blocking moves
    
    # How do i define opp_symbol using the symbols array and access to current players symbol?

    current_win_lines.each do |line| 
      #Check for single integer left in available places to win
      if line.count { |i| i.is_a?(Integer)} == 1 && line.count(symbol) == 2 
        if empty_spot = line.find { |i| i.is_a?(Integer) }
          puts "win line"
          puts empty_spot
          return empty_spot + 1
        end
      end
    end

  current_win_lines.each do |line|
      # Check for single integer left in available places to block opponent win
    if line.count { |i| i.is_a?(Integer)} == 1 && line.count(opp_symbol) == 2 
      if empty_spot = line.find { |i| i.is_a?(Integer) }
        puts "block line"
        puts empty_spot
        return empty_spot + 1
      end
    end
  end
    #random choice
    pp current_options

    corners_and_middle = current_options - [2,4,6,8]
    current_options = corners_and_middle unless corners_and_middle.empty?
    puts "hello"
    pp current_options

    pick = current_options.sample 
    
    # corner trap and corner trap defense?
    # randomize positions with the center and corners taking precedence
  end


end


        # if empty_spot != nil
        #   pp "empty_spot = #{empty_spot}"
        #   # return empty_spot
        # else
        #    #random choice
        #   current_options.sample
        # end