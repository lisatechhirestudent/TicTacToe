require "minitest/autorun"
require_relative "unbeatable.rb"
require_relative "board.rb"

class TestUnbeatable < Minitest::Test

	def test_x_return_x
		player = UnbeatableConsole.new("X")
		assert_equal("X",player.marker)
	end

	def test_win_finds_correct_move
		board = Board.new
		board.ttt_board = ["X","O","","","X","O","","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.make_win(board.ttt_board)
		assert_equal(8,result)
	end

	def test_block_finds_correct_move
		board = Board.new
		board.ttt_board = ["O","O","","","X","O","X","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.block_win(board.ttt_board)
		assert_equal(2,result)
	end

	def test_make_fork_correct_move
		board = Board.new
		board.ttt_board = ["X","","","","O","X","","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.make_fork(board.ttt_board)
		assert_equal(2,result)
	end

	def test_block_fork_correct_move
		board = Board.new
		board.ttt_board = ["O","","","","X","O","","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.block_fork(board.ttt_board)
		assert_equal(2,result)
	end

	def test_find_open_center
		board = Board.new
		board.ttt_board = ["O","","X","","","O","X","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.find_open_center(board.ttt_board)
		assert_equal(4,result)
	end

	def test_find_center_not_avail
		board = Board.new
		board.ttt_board = ["O","","X","","X","O","X","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.find_open_center(board.ttt_board)
		assert_equal(10,result)
	end

	def test_find_open_sides
		board = Board.new
		board.ttt_board = ["O","X","X","X","O","O","X","","X"]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.find_open_sides(board.ttt_board)
		assert_equal(7,result)
	end

	def test_find_open_corner
		board = Board.new
		board.ttt_board = ["O","X","X","X","O","O","X","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.find_open_corner(board.ttt_board)
		assert_equal(8,result)
	end

	def test_map_board
		board = Board.new
		board.ttt_board = ["O","X","X","X","O","O","X","",""]
		unbeatable = UnbeatableConsole.new("X")
		map = [["O", "X", "X"], ["X", "O", "O"], ["X", "", ""], ["O", "X", "X"], ["X", "O", ""], ["X", "O", ""], ["O", "O", ""], ["X", "O", "X"]]
		result = unbeatable.map_board(board.ttt_board)
		assert_equal(map,result)
	end

end