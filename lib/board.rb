

require "byebug"
class Board
  attr_accessor :grid, :mark

  def initialize(grid = Array.new(3) { Array.new(3) })
    @grid = grid
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end

  def empty?(pos)
    self[pos].nil?
  end

  def display(grid)
    @grid
  end

  def winner
    (grid + cols + diagonals).each do |triple|
      return :X if triple.all? { |mark| mark == :X }
      return :O if triple.all? { |mark| mark == :O }
    end
    false
  end

  def cols
    @grid.transpose
  end

  def diagonals
    l_to_r = [[0, 0], [1, 1], [2, 2]]
    r_to_l = [[0, 2], [1, 1], [2, 0]]
    [l_to_r, r_to_l].map do |diag|
      diag.map do |row, col|
        @grid[row][col]
      end
    end
  end

  def over?
    return true if winner
    # @grid.none? { |mark| mark.nil? }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

end
