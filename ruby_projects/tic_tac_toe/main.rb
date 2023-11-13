require_relative "display.rb"
require_relative "board.rb"
require_relative "player.rb"
require_relative "game.rb"

# BOARD = [1,2,3,4,5,6,7,8,9]
# WIN_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]


#start new game 
game = Game.new()
game.intro
board = game.game_board.board
game.display_board(board)

puts "Player 1 - choose your location(using 1 - 9)"
  
  pick1  = gets.chomp #TODO error handling
  board[pick1.to_i - 1] = game.player1.symbol
  pp game.display_board(board)

# game.display_board
# pp game

#  NEXT: Player 2 picks, then abstract from main.rb into proper files - making a method which allows to repeat until board is full, or game winning conditions are met
# main never calls Board, Players - Game class should handle all logic from other classes




  
  