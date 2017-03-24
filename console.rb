require_relative "board.rb"
require_relative "human_console.rb" 

class Console
	attr_accessor :player_1, :player_2, :board, :current_player

	def initialize(player_1,player_2)
		@player_1 = player_1
		@player_2 = player_2
		@board = Board.new
		@current_player = player_1
	end

	def display_board
		puts """        #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} 

        ______

        #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} 

        ______

        #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]}

        """
	end

	def get_move
		current_player.get_move(board.ttt_board)
#puts "Who is current player? #{current_player}"
	end

 	def make_move(move)
 		board.update_board(move,current_player.marker)
	end

	def change_player()
		if current_player == player_1
			@current_player = player_2
		else
			@current_player = player_1
		end
	end
	
	def game_over?()
		board.board_win?(current_player.marker) || board.full_board?()
	end

	def finish()
		if board.board_win?(current_player.marker) 
			puts "Winner is #{current_player.marker}"
		else 
			puts "No Winner--Tie"
		end
	end
end

#{board.current_player.marker}