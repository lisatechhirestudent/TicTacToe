class UnbeatableConsole

	#attr_reader :corners, :sides, :center
	attr_reader :corners, :sides, :center, :opposite_corners
	attr_accessor :marker

	def initialize(marker)
		@marker = marker
		@corners = [0,2,6,8]
		@opposite_corners = [[0,8],[2,6]]
		@sides = [1,3,5,7]
		@center = [4]
	end

	def get_move(board)
		if make_win(board) < 10
			position = make_win(board)
		elsif block_win(board) < 10
			position = block_win(board)
		elsif make_fork(board) < 10
			position = make_fork(board)
		elsif block_fork(board) < 10
			position = block_fork(board)
		elsif find_open_center(board) < 10
			position = find_open_center(board)
		elsif find_open_sides(board) < 10
			position = find_open_sides(board)			
		elsif find_open_corners(board) < 10
			position = find_open_corners(board)
		elsif find_opposite_corners(board) < 10
			position = find_opposite_corners(board)
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

	def map_board(board)
		board_map = [board[0],  board[1],  board[2]],
		[board[3],  board[4],  board[5]],
		[board[6],  board[7],  board[8]],
		[board[0],  board[3],  board[6]],
		[board[1],  board[4],  board[7]],
		[board[2],  board[5],  board[8]],
		[board[0],  board[4],  board[8]],
		[board[2],  board[4],  board[6]]
	end

	def make_win(board)
		move = 10
		count = 0
		win_array = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		board_map = map_board(board)
		board_map.each_with_index do |inner,indx1|
			if inner.count(self.marker) == 2 && inner.count("") == 1
				move = win_array[indx1][inner.index("")]
			end
		end
		move
	end

	def block_win(board)
		move = 10
		count = 0
		if self.marker == "X"
			other_marker = "O"
		else
			other_marker = "X"
		end
		win_array = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		board_map = map_board(board)
		board_map.each_with_index do |inner,indx1|
			if inner.count(other_marker) == 2 && inner.count("") == 1
				move = win_array[indx1][inner.index("")]
			end
		end	
		move
	end

	def make_fork(board)
		move = 10
		possible_play = []
		win_array = [[0,1,2],[3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		board_map = map_board(board)

		board_map.each_with_index do |inner,indx1|
			if inner.count(self.marker) == 1 && inner.count("") == 2
				possible_play << win_array[indx1]
			end
		end
		flat_plays = possible_play.flatten
		flat_plays.each do |check|
			if flat_plays.count(check) > 1
				if board[check] == ""
					move = check
				end
			end
		end
		move
	end

	def block_fork(board)
		move = 10
		if self.marker == "X"
			other_marker = "O"
		else
			other_marker = "X"
		end
		possible_play = []
		win_array = [[0,1,2],[3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		board_map = map_board(board)

		count_corner = 0
		opposite_corners.each do |check| #[[0,8],[2,6,]]
			check.each do |indx|
				if board[indx] == other_marker
					count_corner += 1
				end
				if count_corner == 2
					move = find_open_sides(board)		
				end
			end
		end

		if move == 10
			board_map.each_with_index do |inner,indx1|
				if inner.count(other_marker) == 1 && inner.count("") == 2
					possible_play << win_array[indx1]
				end
			end
			flat_plays = possible_play.flatten
			flat_plays.each do |check|
				if flat_plays.count(check) > 1
					if board[check] == ""
						move = check
					end
				end
			end
		end
		move
	end
end	

