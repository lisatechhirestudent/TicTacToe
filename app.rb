require "sinatra"
require_relative "board.rb"
require_relative "human_console.rb" 
require_relative "sequential.rb"
require_relative "random.rb"
enable :sessions

get'/' do 
board = Board.new
  erb :welcomettt, :locals=> {:board=>board.ttt_board}
end

post '/player_1' do
  p1_name = params[:p1_name]
  redirect '/player_2?p1_name='+p1_name
end
get '/player_2' do
  p1_name = params[:p1_name]
  erb :p2_type,locals: {p1_name: p1_name}
end
post '/gamer' do
	game_type=params[:game_type]
	if game_type=="human"
		session[:player_2] = HumanConsole.new("o")
	elsif game_type=="sequential"
	session[:player_2] = SequentialConsole.new("o")
    elsif game_type=="random"
	session[:player_2] = RandomConsole.new("o")
	end
	session[:p1_name] = params[:p1_name]
	session[:board] = Board.new
	session[:player_1] = HumanConsole.new("x")
	
	session[:current_player] = session[:player_1]
#"#{session[:p1_name]} and #{session[:p2_name]}"
	session[:message] = "Welcome"
	redirect "/gameplayroute"


end
post '/player_2' do
	session[:p1_name] = params[:p1_name]
	session[:player_2] = SequentialConsole.new("o")
	p2_name = params[:p2_name]
	session[:board] = Board.new
	session[:player_1] = HumanConsole.new("x")
	
	session[:current_player] = session[:player_1]
#"#{session[:p1_name]} and #{session[:p2_name]}"
	session[:message] = "Welcome"
	redirect "/gameplayroute"
end

get '/gameplayroute' do
	message= params[:message]
	erb :gameplayboard,locals: {board: session[:board].ttt_board, message: message} 

end
post '/move' do 
	move = params[:pick].to_i
	
	if session[:board].open_space?(move)
	    session[:board].update_board(move,session[:current_player].marker)
	else
		session[:message]="space_already_taken"
		redirect '/gameplayroute'
	end		
	if  session[:board].board_win?(session[:current_player].marker) || session[:board].full_board?()
		redirect '/finish'
	else 
		if session[:current_player] == session[:player_1]
		   session[:current_player] = session[:player_2]
		else
		   session[:current_player] = session[:player_1]
		end
		session[:message] ="player_changed" 

		if session[:current_player].class != HumanConsole
			move = session[:current_player].get_move(session[:board].ttt_board)
			session[:board].update_board(move,session[:current_player].marker)
			if  session[:board].board_win?(session[:current_player].marker) || session[:board].full_board?()
				redirect '/finish'
			else 
				if session[:current_player] == session[:player_1]
		   			session[:current_player] = session[:player_2]
				else
		   			session[:current_player] = session[:player_1]
				end
				session[:message] ="player_changed" 
			end
		end
		redirect '/gameplayroute'
	end
end

get '/finish' do
	if session[:board].board_win?(session[:current_player].marker) 
		erb :winner
	else 
		erb :tie
	end
end

