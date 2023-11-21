class Board
  
  attr_accessor :board_arr, :current_win_lines

  def initialize(board_arr = [1,2,3,4,5,6,7,8,9])
    @board_arr = board_arr
    @current_win_lines = [[0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]]
  end

  def update_win_lines(pick, symbol)
    @current_win_lines = @current_win_lines.collect do |line|
         line.collect! do |position| 
           if position == pick 
             symbol
           else
             position
           end
         end
     end
     
   end
end

