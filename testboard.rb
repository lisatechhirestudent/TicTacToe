require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

	def test_new_board
		board = Board.new
		assert_equal(Array.new(9,""),board.ttt_board)
	end

	def test_update_with_x_first_position
		board = Board.new
		board.update_board(0,"x")
		assert_equal(["x","","","","","","","",""],board.ttt_board)
	end

	def test_update_board
		board = Board.new
		board.update_board(0,"x")
		board.update_board(8,"o")
		assert_equal(["x","","","","","","","","o"],board.ttt_board)
	end

	def test_update_board_2
		board = Board.new
		board.update_board(0,"x")
		board.update_board(8,"o")
		board.update_board(7,"x")
		assert_equal(["x","","","","","","","x","o"],board.ttt_board)
	end	

	def test_update_the_4th_position_returns_o
		board = Board.new
		board.ttt_board = ["x","","","","","","","x","o"]
		board.update_board(3,"o")
		assert_equal(["x","","","o","","","","x","o"],board.ttt_board)
	end

	def test_open_space
		board = Board.new
		board.ttt_board = ["x","o","o","","","","x","x","x"]
		assert_equal(true,board.open_space?(3))
	end

	def test_open_space_2
		board = Board.new
		board.ttt_board = ["x","o","","","","","x","x","o"]
		assert_equal(true,board.open_space?(2))
	end
	def test_open_space_3
		board = Board.new
		board.ttt_board = ["x","o","","","","","x","x","x"]
		assert_equal(false,board.open_space?(55))
	end

	def test_full_board_return_false
		board = Board.new
		board.ttt_board = ["x","o","o","x","o","x","x","o",""]
		assert_equal(false,board.full_board?())
	end
	def test_win
		board = Board.new
		board.ttt_board = ["x","x","x","","","","","",""]
		marker = "x"
		assert_equal(true,board.board_win?(marker))
	end

	def test_non_win_with_3_consecutive_positions_returns_false
		board = Board.new
		board.ttt_board = ["","x","x","o","","","","",""]
		marker = "x"
		assert_equal(false,board.board_win?(marker))
	end

	def test_non_win_for_3_consecutive_positions_returns_false
		board = Board.new
		board.ttt_board = ["","x","x","x","","","","",""]
		marker = "x"
		assert_equal(false,board.board_win?(marker))
	end
end
