require "sinatra"
require_relative "board.rb"
require_relative "webappgame.rb"
enable :sessions

board = ["","","","","","","","",""]


get'/' do 



  erb :welcomettt
end

post '/player_1' do
  p1_name = params[:p1_name]
  redirect '/player_2?p1_name='+p1_name
end
get '/player_2' do
  p1_name = params[:p1_name]
  erb :p2_name,locals: {p1_name: p1_name}
end
post '/player_2' do
	session[:p1_name] = params[:p1_name]
	session[:p2_name] = params[:p2_name]
	session[:board] = Board.new
#"#{session[:p1_name]} and #{session[:p2_name]}"
	redirect '/gameplayroute'
end

get '/gameplayroute' do
	erb :gameplayboard,locals: {board: session[:board].ttt_board} 

end
post '/move' do 
	move = params[:pick].to_i
	session[:board].update_board(move,"x")
	redirect '/gameplayroute'
end