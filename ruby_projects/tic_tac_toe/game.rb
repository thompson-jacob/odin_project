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

def play_game
  i=0
  players = [@player1, @player2]
  while i < 9  do
    pick_location(players[0])
    winner = check_winner()
    if check_winner() != false
      display_winner(winner)
      break
    end

    i+=1

    if i == 9
      puts "-----"
      puts "DRAW!"
      puts "-----\n"
    end

    players.rotate!
  end
end


def pick_location(player)
  display_board(@board_array)
  puts "#{player.name} - choose your location (using 1 - 9)"
  current_options = @board_array.select { |i| i.is_a?(Integer) }

  if player.class == ComputerPlayer
    pick = player.computer_pick(@board_array, @game_board.current_win_lines)
    puts "#{player.name} selects position #{pick}"
    @board_array[pick - 1] = player.symbol
    @game_board.update_win_lines((pick - 1), player.symbol)
    sleep(1)
    return
  end

  loop do
    pick = gets.chomp.to_i
    if current_options.include?(pick)
    puts "#{player.name} selects position #{pick}"
      @board_array[pick - 1] = player.symbol
      @game_board.update_win_lines((pick - 1), player.symbol)
      sleep(1)
      break
    else
      puts "Invalid choice. Please choose a valid remaining number from: #{current_options}"
    end
  end
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
  # swaps players to determine initiative and re-instantiates Board
  @player1, @player2 = @player2, @player1
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
end


