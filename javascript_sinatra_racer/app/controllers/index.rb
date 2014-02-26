get '/' do
  erb :start_form
end

post '/players/new' do
  @player_one = Player.find_or_create_by_name(params[:player_one])
  @player_two = Player.find_or_create_by_name(params[:player_two])
  session[:p1_id] = @player_one.id
  session[:p2_id] = @player_two.id
  redirect "/games/new"
end

get '/games/new' do
  erb :game_board
end

post '/games/new' do #/player1_id=:player_1_id' do
  @player_one = Player.find_by_id(session[:p1_id])
  @player_two = Player.find_by_id(session[:p2_id])

  @game = Game.create();
  @game.players << @player_one
  @game.players << @player_two

  if params[:the_winner] == "player_one"
    the_best = @game.gameplayers.find_by_player_id(@player_one.id)
    the_best.winner = true
    the_best.save
    redirect '/'
  else
    the_best = @game.gameplayers.find_by_player_id(@player_two.id)
    the_best.winner = true
    the_best.save
    redirect '/'
  end
  redirect '/'
end

get '/games/:id' do
  # Show results of a particular game.
end

get '/games' do
  # List all of the games played. Links to individual game
  # scores.
end


