
require_relative "game.rb"

#start new game 
game = Game.new() 
game.intro
pp game
begin
  game.play_game
  game.game_reset
end while game.play_again






  
  