require "minitest/autorun"
require_relative "sequential.rb"

class TestSequential < Minitest::Test

	def test_sequential_if_first_space_available?
		player = SequentialConsole.new("x")
		assert_equal("x",player.marker)
	end

	def test_sequential_empty_board_returns_zero_position
		player = SequentialConsole.new("x")
		board = ["","","","","","","","",""]
		assert_equal(0,player.get_move(board))
	end

	def test_sequential_partial_board_returns_zero_position
		player = SequentialConsole.new("x")
		board = ["x","","","x","","","o","x","o"]
		assert_equal(1,player.get_move(board))
		
	end





end