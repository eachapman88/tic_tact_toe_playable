load "board.rb"
b = Board.new
load "computer_player.rb"
c = ComputerPlayer.new
load "human_player.rb"
h = HumanPlayer.new
load "game.rb"
g = Game.new
g.play

display current_player
display player1
display player2
display current_player.name
display pos
display current_player.mark
display board.over?
display board.winner
