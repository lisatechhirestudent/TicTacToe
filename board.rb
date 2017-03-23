class Board
	attr_accessor :ttt_board
	def initialize
		@ttt_board = Array.new(9,"")
	end

	def update_board(position,marker)
		@ttt_board[position] = marker
	end

	def open_space?(position)
		@ttt_board[position] == ""
	end
	def full_board?()
		@ttt_board.count("") == 0  
	end

	def valid_choice?(choice)
		if choice > 8
			false
		else true
		end
	end

	def board_win?(marker)
		@ttt_board[0] == marker && @ttt_board[1] == marker && @ttt_board[2] == marker ||
		@ttt_board[3] == marker && @ttt_board[4] == marker && @ttt_board[5] == marker ||
		@ttt_board[6] == marker && @ttt_board[7] == marker && @ttt_board[8] == marker ||
		@ttt_board[2] == marker && @ttt_board[4] == marker && @ttt_board[6] == marker ||
		@ttt_board[0] == marker && @ttt_board[4] == marker && @ttt_board[8] == marker ||
		@ttt_board[0] == marker && @ttt_board[3] == marker && @ttt_board[6] == marker ||
		@ttt_board[1] == marker && @ttt_board[4] == marker && @ttt_board[7] == marker ||
		@ttt_board[2] == marker && @ttt_board[5] == marker && @ttt_board[8] == marker 
	end
end

	def input?(user_input)

		if user_input =~ /^-?[0-9]+$/ && user_input.to_i < 9

			true

		else false

		end

	end
end

	# def player
	# 	player_1 = "x"
	# 	player_2 = "o"
	# 	current_player = player_1
	# end

	# def changed_player(current_player)
	# 	if current_player == player_1
	# 	current_player = player_2
	# 	elsif current_player == player_2
	# 	current_player = player_1
	# 	end
	# end
# def input?(user_input)

# 		if user_input =~ /^-?[0-9]+$/ && user_input.to_i < 9

# 			true

# 		else false
# 		end
# 	end
# end
