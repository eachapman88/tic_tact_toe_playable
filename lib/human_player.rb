require "byebug"
class HumanPlayer

  attr_accessor :name, :board, :mark

  def initialize(name = "Laura")
    @name = name
  end

  def display(board)
    row0 = "0 |"
    (0..2).each do |col|
      row0 << (board.empty?([0, col]) ? "   |" : " " + board[[0, col]].to_s + " |")
    end
    row1 = "1 |"
    (0..2).each do |col|
      row1 << (board.empty?([1, col]) ? "   |" : " " + board[[1, col]].to_s + " |")
    end
    row2 = "2 |"
    (0..2).each do |col|
      row2 << (board.empty?([2, col]) ? "   |" : " " + board[[2, col]].to_s + " |")
    end

    puts "    0   1   2  "
    puts "  |-----------|"
    puts row0
    puts "  |-----------|"
    puts row1
    puts "  |-----------|"
    puts row2
    puts "  |-----------|"
  end

  def get_move
    puts "Where would you like to move? Ex: (0,0)"
    input = gets.chomp
    input.split(",").map(&:to_i)
  end

end
