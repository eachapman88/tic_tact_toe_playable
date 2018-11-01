require "byebug"

class ComputerPlayer

attr_accessor :name, :board, :mark

def initialize(name = "Bonzo")
  @name = name
end

def place_comp_mark(board)

  winning_position = wins?(board)

  if winning_position != false
    board.place_mark(winning_position, mark)
  else
  pos = find_random_pos(board)
  board.place_mark(pos, mark)
  end
end

def wins?(board)
  available = avail_pos(board)

  available.each do |pos|
    board[pos] = mark

    if board.winner == mark
      board[pos] = nil
      return pos
    else
      board[pos] = nil
    end
  end
  false
end

def avail_pos(board)
  avail_pos = []
  (0..2).each do |row|
    (0..2).each do |col|
      avail_pos << [row,col] if board.grid[row][col].nil?
    end
  end
  avail_pos
end

def find_random_pos(board)
  avail_pos(board).sample
end


end
