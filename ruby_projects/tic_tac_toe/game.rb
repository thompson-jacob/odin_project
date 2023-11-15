require_relative "display.rb"
require_relative "board.rb"
require_relative "player.rb"

class Game
  WIN_LINES = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]
 include Display
 
 attr_accessor :game_board, :player1, :player2

 def initialize
  @player1 = Player.new('X')
  @player2 = Player.new('O')
  @game_board = Board.new
  @board_array = @game_board.board_arr
 end

 def play_again 
  puts "Play again? (y or n)"
  gets.chomp().downcase == "y" 
 end

 def check_winner 
  WIN_LINES.each do |line|
    if line.all? { |i| @board_array[i] == 'X' }
      puts 'X wins!'
      return true
    elsif line.all? { |i| @board_array[i] == 'O' }
      puts 'O wins!'
      return true
      
    end
  end
end

def play_game
  
  
  puts self.display_board(@board_array)
  i = 0
  while i < 9  do
    puts "#{self.player1.name} - choose your location(using 1 - 9)"
    pick1  = gets.chomp() #TODO error handling
    @board_array[pick1.to_i - 1] = self.player1.symbol
    puts self.display_board(@board_array)
    if check_winner() == true
      break
    end
    i+=1
      puts "#{self.player2.name} - choose your location(using 1 - 9)"
    pick2  = gets.chomp #TODO error handling
    @board_array[pick2.to_i - 1] = self.player2.symbol
    puts self.display_board(@board_array)
    if check_winner() == true
      break
    end
    i+=1
  end
  if i == 8
    puts "draw"
  end
  
end

 

 
end