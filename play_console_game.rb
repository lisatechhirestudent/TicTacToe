require_relative "console.rb"

game = Console.new(SequentialConsole.new("x"),SequentialConsole.new("o"))

game.display_board
# move = game.get_move 
# game.make_move(move)
# game.display_board

# game.change_player
# move = game.get_move
# game.make_move(move)
# game.display_board
# # game_board.display_board.board.tttboard
# game.change_player
# move = game.get_move
# game.make_move(move)
# game.display_board

 until game.game_over?
 	game.change_player
 	move = game.get_move
 	game.make_move(move)
 	game.display_board
 end
 	game.finish


# 	move = game.get_move
# 	game.make_move(move)
# 	game.display_board
# end

	# puts "Invalid Space"
	# move = game.get_move
	# game.make_move(move)
# game.display_ board
# move = game.get_move
	# game.display_board
	# game.change_player
#game.current_player

 		#puts "The winner is #{marker}"
		