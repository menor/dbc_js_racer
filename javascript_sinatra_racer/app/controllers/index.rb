get '/games/new' do
  erb :game_board
  # Play game here. Post game information to gameplayers
  # through post '/games/new'.
end

get '/' do
  erb :start_form
  # Form for player 1 & 2 -> Post to '/players/new'
  # to create the players.
end

post '/players/new' do
  @player_one = Player.create(name: params[:player_one])
  @player_two = Player.create(name: params[:player_two])
  redirect '/games/new'
end


post '/games/new' do
  # Create gameplayers object and redirect to '/games/:id' to
  # show the results.
end

get '/games/:id' do
  # Show results of a particular game.
end

get '/games' do
  # List all of the games played. Links to individual game
  # scores.
end


