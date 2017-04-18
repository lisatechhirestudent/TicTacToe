require "minitest/autorun"
require_relative "unbeatable.rb"
require_relative "board.rb"

class TestUnbeatable < Minitest::Test

	def test_x_return_x
		player = UnbeatableConsole.new("x")
		assert_equal("x",player.marker)
	end
end