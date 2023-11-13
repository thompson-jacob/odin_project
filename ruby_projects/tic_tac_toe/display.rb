module Display
  
  def intro
    puts "Lets Play Tic-Tac-Toe\n"
    puts "\nPlayer #1 - Enter your name"
    @player1.name = gets.chomp

    puts "\nPlayer #2 - Enter your name"
    @player2.name = gets.chomp
    puts "\n-----------"
  end

  def display_board(board)
    board_display = <<~HEREDOC
    Game Board:
    -----------
     #{board[0]} | #{board[1]} | #{board[2]}
    -----------
     #{board[3]} | #{board[4]} | #{board[5]}
    -----------
     #{board[6]} | #{board[7]} | #{board[8]}
    -----------
    \n
  HEREDOC
  
  puts board_display
  end
  
end