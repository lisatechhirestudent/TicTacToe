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
		position = make_win(board)
 		elsif block_win(board) < 10 
 			position = block_win(board) 
		elsif block_fork(board) < 10 
			position = block_fork(board) 
 		elsif make_fork(board) < 10 
 			position = make_fork(board) 
		elsif find_open_corner(board) < 10 
			position = find_open_corner(board) 
		elsif block_fork(board) < 10 
			position = block_fork(board) 
 		elsif find_open_center(board) < 10 
 			position = find_open_center(board) 
		elsif find_open_corner(board) < 10 
			position = find_open_corner(board) 
		elsif find_open_sides(board) < 10 
 			position = find_open_sides 
 		end 
 
@@ -60,14 +61,14 @@ def find_open_center(board)
 	end 
 
 	def map_board(board) 
-		board_map = [board.ttt_board[0],  board.ttt_board[1],  board.ttt_board[2]], 
-		[board.ttt_board[3],  board.ttt_board[4],  board.ttt_board[5]], 
-		[board.ttt_board[6],  board.ttt_board[7],  board.ttt_board[8]], 
-		[board.ttt_board[0],  board.ttt_board[3],  board.ttt_board[6]], 
-		[board.ttt_board[1],  board.ttt_board[4],  board.ttt_board[7]], 
-		[board.ttt_board[2],  board.ttt_board[5],  board.ttt_board[8]], 
-		[board.ttt_board[0],  board.ttt_board[4],  board.ttt_board[8]], 
-		[board.ttt_board[2],  board.ttt_board[4],  board.ttt_board[6]] 
		board_map = [board[0],  board[1],  board[2]], 
+		[board[3],  board[4],  board[5]], 
+		[board[6],  board[7],  board[8]], 
+		[board[0],  board[3],  board[6]], 
+		[board[1],  board[4],  board[7]], 
+		[board[2],  board[5],  board[8]], 
+		[board[0],  board[4],  board[8]], 
+		[board[2],  board[4],  board[6]] 
 	end 
 
 	def make_win(board) 
 
@@ -106,6 +107,7 @@ def make_fork(board)
 		possible_play = [] 
 		win_array = [[0,1,2],[3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8],[0,4,8],[2,4,6]] 
 		board_map = map_board(board) 
 
+ 


 
 		board_map.each_with_index do |inner,indx1| 
 			if inner.count(self.marker) == 1 && inner.count("") == 2 
 				possible_play << win_array[indx1] 
@@ -114,7 +116,7 @@ def make_fork(board)
 		flat_plays = possible_play.flatten 
 		flat_plays.each do |check| 
 			if flat_plays.count(check) > 1 
-				if board.ttt_board[check] == "" 
+				if board[check] == "" 
 					move = check 
 				end 


 
 			end 
 
@@ -132,73 +134,35 @@ def block_fork(board)


 
 		possible_play = [] 


 
 		win_array = [[0,1,2],[3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8],[0,4,8],[2,4,6]] 


 
 		board_map = map_board(board) 


 
-		board_map.each_with_index do |inner,indx1| 


 
-			if inner.count(other_marker) == 1 && inner.count("") == 2 


 
-				possible_play << win_array[indx1] 


 
-			end 


 
-		end 


 
-		flat_plays = possible_play.flatten 


 
-		flat_plays.each do |check| 


 
-			if flat_plays.count(check) > 1 


 
-				if board.ttt_board[check] == "" 


 
-					move = check 


 
-				end 


 
-			end 


 
-		end 


 
-		move 


 
-	end 


 
-end	 


 
  


 
-def make_fork_diagonal(board) 


 
-		move = 10 


 
-		if self.marker == "X" 


 
-			other_marker = "O" 


 
-		else 


 
-			other_marker = "X" 


 
-		end 


 
-		possible_play = [] 


 
-		win_array = [[0,4,8],[2,4,6]] 


 
-		board_map = map_board(board) 


 
-		board_map.each_with_index do |inner,indx1| 


 
-			if inner.count(self_marker) == 1 && inner.count("") == 2 


 
-				possible_play << win_array[indx1] 


 
-			end 


 
-		end 


 
-		flat_plays = possible_play.flatten 


 
-		flat_plays.each do |check| 


 
-			if flat_plays.count(check) > 1 


 
-				if board.ttt_board[check] == "" 


 
-					move = check 


 
+		count_corner = 0 


 
+		opposite_corners.each do |check| #[[0,8],[2,6,]] 


 
+			check.each do |indx| 


 
+				if board[indx] == other_marker 


 
+					count_corner += 1 


 
+				end 


 
+				if count_corner == 2 


 
+					move = find_open_sides(board)		 


 
 				end 


 
 			end 


 
 		end 


 
-		move 


 
-	end 


 
-end 


 
  


 
-def block_fork_diagonal(board) 


 
-		move = 10 


 
-		if self.marker == "X" 


 
-			other_marker = "O" 


 
-		else 


 
-			other_marker = "X" 


 
-		end 


 
-		possible_play = [] 


 
-		win_array = [[0,4,8],[2,4,6]] 


 
-		board_map = map_board(board) 


 
-		board_map.each_with_index do |inner,indx1| 


 
-			if inner.count(other_marker) == 1 && inner.count("") == 2 


 
-				possible_play << win_array[indx1] 


 
+		if move == 10 


 
+			board_map.each_with_index do |inner,indx1| 


 
+				if inner.count(other_marker) == 1 && inner.count("") == 2 


 
+					possible_play << win_array[indx1] 


 
+				end 


 
 			end 


 
-		end 


 
-		flat_plays = possible_play.flatten 


 
-		flat_plays.each do |check| 


 
-			if flat_plays.count(check) > 1 


 
-				if board.ttt_board[check] == "" 


 
-					move = check 


 
+			flat_plays = possible_play.flatten 


 
+			flat_plays.each do |check| 


 
+				if flat_plays.count(check) > 1 


 
+					if board[check] == "" 


 
+						move = check 


 
+					end 


 
 				end 


 
 			end 


 
 		end 


 
 		move 


 
 	end 


 
 end	 