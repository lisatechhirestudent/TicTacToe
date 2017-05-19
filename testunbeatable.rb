require "minitest/autorun"
require_relative "unbeatable.rb"
require_relative "board.rb"

class TestUnbeatable < Minitest::Test

	def test_x_return_x
		player = UnbeatableConsole.new("x")
		assert_equal("x",player.marker)
	end

	def test_win_finds_correct_move
		board = Board.new
		board.ttt_board = ["X","O","","","X","O","","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.make_win(board)
		assert_equal(8,result)
	end

	def test_block_finds_correct_move
		board = Board.new
		board.ttt_board = ["O","O","","","X","O","X","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.block_win(board)
		assert_equal(2,result)
	end

	def test_make_fork_correct_move
		board = Board.new
		board.ttt_board = ["X","","","","O","X","","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.make_fork(board)
		assert_equal(2,result)
	end

	def test_block_fork_correct_move
		board = Board.new
		board.ttt_board = ["O","","","","X","O","","",""]
		unbeatable = UnbeatableConsole.new("X")
		result = unbeatable.block_fork(board)
		assert_equal(2,result)
	end

end