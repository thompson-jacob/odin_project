module Display
  
  def intro
    puts "Lets Play Tic-Tac-Toe\n"
    puts "\nPlayer #1 - Enter your name"
    @player1.name = gets.chomp
    @player1.symbol = "X"
    puts "\nPlayer #2 - Enter your name"
    @player2.name = gets.chomp
    @player2.symbol = "O"
    puts "\n-----------"
  end

  def display_board(board)
    board_display = 
      <<~HEREDOC
        Game Board:
        -----------
        #{board[0]} | #{board[1]} | #{board[2]}
        -----------
        #{board[3]} | #{board[4]} | #{board[5]}
        -----------
        #{board[6]} | #{board[7]} | #{board[8]}
        -----------
        
      HEREDOC
    
    return board_display
    
  end

  def display_winner(winner)
   winners_board = 
    <<~HEREDOC
      Game Board:
      -----------
      #{winner.symbol} | #{winner.symbol} | #{winner.symbol}
      -----------
      #{winner.name} wins!                  
      -----------
      #{winner.symbol} | #{winner.symbol} | #{winner.symbol}
      -----------
      
    HEREDOC
  
  puts winners_board
  end
  
end