class Board
	attr_accessor :ttt_board
	def initialize
		@ttt_board = Array.new(9,"")

	end

	def update_board(position,marker)
		@ttt_board[position] = marker
	end

	def open_space?(position)
		ttt_board[position] == ""
	end
end