require "minitest/autorun"
require_relative "random.rb"
require_relative "board.rb"

class TestRandom < Minitest::Test

	def test_random_if_first_space_available?
		player = RandomConsole.new("x")
		board = Board.new 
		board = ["x","o","x","","o","x","o","x","o"]
		#assert_equal("x",player.marker)
		assert_equal(3,player.get_move(board))
	end

	def test_random_if_two_spaces_available?
		player = RandomConsole.new("x")
		#board = Board.new 
		board = ["x","","x","","o","x","o","x","o"]
		#assert_equal("x",player.marker)
		assert_equal(true,[1,3].include?(player.get_move(board)))
	end

	def test_random_if_three_spaces_available?
		player = RandomConsole.new("x")
		board = Board.new 
		board = ["x","","x","","","x","o","x","o"]
		assert_equal("x",player.marker)
		assert_equal(true,[1,3,4].include?(player.get_move(board)))
	end

	def test_empty_board
		player = RandomConsole.new("x")
		board = ["","","","","","","","",""]
		assert_equal(["","","","","","","","",""],board)
	end
end