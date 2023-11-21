module Display
  
  def intro
    puts "Lets Play Tic-Tac-Toe\n"
    
    puts "is Player #1 computer or human? (C or H)"
    answer = gets.chomp().downcase 
    while !['c', 'h'].include?(answer)
      puts "Please enter 'C' for Computer or 'H' for Human"
      answer = gets.chomp().downcase 
    end
    if answer == 'c' 
      @player1 = ComputerPlayer.new('X')
    else
      puts "\nPlayer #1 - Enter your name"
      @player1.name = gets.chomp
      @player1.symbol = "X"
    end

    puts "is Player #2 computer or human? (C or H)"
    answer2 = gets.chomp().downcase 
    while !['c', 'h'].include?(answer2)
      puts "Please enter 'C' for Computer or 'H' for Human"
      answer2 = gets.chomp().downcase 
    end
    if answer2 == 'c' 
      @player2 = ComputerPlayer.new('O')
    else
      puts "\nPlayer #2 - Enter your name"
      @player1.name = gets.chomp
      @player1.symbol = "X"
    end
    puts @player2
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
    
    puts board_display
    
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