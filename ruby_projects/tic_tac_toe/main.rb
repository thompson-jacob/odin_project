
require_relative "game.rb"

#start new game 
game = Game.new() 
game.intro
begin
  game.play_game
  game.game_reset
end while game.play_again


#  NEXT: Player 2 picks, then abstract from main.rb into proper files - making a method which allows to repeat until board is full, or game winning conditions are met
# main never calls Board, Players - Game class should handle all logic from other classes

# TODO: Add input validations 
  # - why is 9 default entry?
  # Lock board once player has placed Symbol



  
  