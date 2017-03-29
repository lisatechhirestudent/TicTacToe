class HumanConsole
 
	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end
	
	def get_move(board)
		puts "Pick a space"
		move = gets.chomp.to_i
	 	if board[move] == ""
	 		move
	 	else
	 	puts "Invalid Space"
	 	get_move(board)
	 	end
	end
end