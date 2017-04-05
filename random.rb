class RandomConsole

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board)
		array = []
		# p board.class
		board.each_with_index do |strings,index|
			unless strings.include?("o") || strings.include?("x")
				array.push(index)
			end
	end
	return array.sample
end

end	