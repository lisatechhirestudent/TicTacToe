class UnbeatableConsole

	attr_reader :corners, :sides, :center
	attr_accessor :marker

	def initialize(marker)
		@marker = marker
		@corners = [0,2,6,8]
		@sides = [1,3,5,7]
		@center = [4]
	end

	def get_move(board)
		if make_win(board) < 10
			position = make_win(board)
		elsif block_win(board) < 
			position = block_win(board)
		elsif block_fork(board) < 10
			position = block_fork(board)
		elsif make_fork(board) < 10
			position = make_fork(board)
		elsif find_open_corner(board) < 10
			position = find_open_corner(board)
		elsif find_open_center(board) < 10
			position = find_open_center(board)
		elsif find_open_sides(board) < 10
			position = find_open_sides
		end
	end

	def find_open_corner(board)
		position = 10
		corners.each do |indx|
			if board[indx] == ""
				position = indx
				break
			end
		end
		puts "Move #{position}"
		return position
	end

	def find_open_sides(board)
		move = 10
		sides.each do |indx|
			if board[indx] == ""
				move = indx
			end
		end
		move
	end

	def find_open_center(board)
		move = 10
		center.each do |indx|
			if board[indx] == ""
				move = indx
			end
		end
		move
	end

	def make_win(board)
		move = 10
		win_array = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		win_array.each do |inner|
			if inner.count("o")== 2 
				move = 
		["o","","o"]

		#if 

	end

	def block_win(board)
		move = 10
		["x","x",""]
	end

	def make_fork(board)
		move = 10
	end

	def block_fork(board)
		move = 10
	end
end	