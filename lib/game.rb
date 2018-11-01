require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require "byebug"

class Game

  attr_accessor :player1, :player2, :board, :current_player, :mark

  def initialize(player1 = HumanPlayer.new, player2 = ComputerPlayer.new)
    @player1, @player2 = player1, player2
    @current_player = player1
    @player1.mark, @player2.mark = :X, :O 
    @board = Board.new
  end

  def play
    until board.over?

      if current_player == player1
        current_player.display(board)
        pos = player1.get_move
          if valid_move?(pos)
            board.place_mark(pos, player1.mark)
            system('clear')
            switch_players
          else
            puts "Invalid move. Please try again."
            play
          end
      else
        player2.place_comp_mark(board)
        switch_players
      end
    end
    player1.display(board)
    puts "Game over! The winner is: "
    return player1.name if board.winner == player1.mark
    return player2.name if board.winner == player2.mark
  end

  def valid_move?(pos)
    board[pos].nil?
  end

  def switch_players
    if current_player == player1
      @current_player = player2
    else
      @current_player = player1
    end
  end

end
