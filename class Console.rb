require_relative "board.rb"

class Console
	attr_accessor :player_1, :player_2, :board, :current_player

	def initialize(player_1,player_2)
		@player_1 = player_1
		@player_2 = player_2
		@board = Board.new
		@current_player = player_1

	end

	def display_board
		puts """ #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]}
		         _________        #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]}         _________        
		         #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]}        
		     """
	end

				

 





						
						





		

end