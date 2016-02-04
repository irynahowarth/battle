require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  use Rack::Session::Pool, :expire_after => 2592000

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player1_name])
    player2 = Player.new(params[:player2_name])
    $game = Game.new(player1,player2)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    if @game.players[1].hit_points == 10
      redirect to('/game_over')
    else
      @game.attack(@game.players[1])
      erb :attack
    end
  end

  get '/game_over' do
    @game = $game
    @game.attack(@game.players[1])
    erb :game_over
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
