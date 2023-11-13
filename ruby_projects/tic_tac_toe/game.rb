
class Game
 include Display
 
 attr_accessor :game_board, :player1, :player2

 def initialize
  @player1 = Player.new('X')
  @player2 = Player.new('O')
  @game_board = Board.new
 end

 
end