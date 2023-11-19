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
  @player1 = Player.new()
  @player2 = Player.new()
  @game_board = Board.new
  @board_array = @game_board.board_arr
 end

 def play_again 
  puts "Play again? (y or n)"
  answer = gets.chomp().downcase 

  while !['y', 'n'].include?(answer)
    puts 'Please enter y or n'
    answer = gets.chomp().downcase 
  end

  answer == "y" 
 end

 def check_winner 
  WIN_LINES.each do |line|
   
    if line.all? { |i| @board_array[i] == @player1.symbol }
      return @player1
    elsif line.all? { |i| @board_array[i] == @player2.symbol }
      return @player2
    end
  end
  return false
end

def game_reset
  @player1.symbol, @player2.symbol = @player2.symbol, @player1.symbol
  @game_board = Board.new
  @board_array = @game_board.board_arr
end

def play_game
  
  
  puts self.display_board(@board_array)
  i=0
  while i <= 9  do
    puts "#{self.player1.name} - choose your location(using 1 - 9)"
    pick1  = gets.chomp() #TODO error handling
    @board_array[pick1.to_i - 1] = self.player1.symbol
    puts self.display_board(@board_array)

    winner = check_winner()
    
    if winner != false
      display_winner(winner)
      break
    end
    
    i+=1

    puts "#{self.player2.name} - choose your location(using 1 - 9)"
    pick2  = gets.chomp #TODO error handling
    @board_array[pick2.to_i - 1] = self.player2.symbol
    puts self.display_board(@board_array)
    winner = check_winner()
    if check_winner() != false
      display_winner(winner)
      break
    end
    i+=1
  end
  if i == 9
    puts "draw"
  end
  
end


end