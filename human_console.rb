class HumanConsole

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end
	
	def get_move(board)
		puts "Pick a space"
		move = gets.chomp.to_i

	end

end