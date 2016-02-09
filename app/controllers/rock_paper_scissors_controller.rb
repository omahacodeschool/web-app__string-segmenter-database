require_relative '../../lib/RockPaperScissorsGame/RPS_Game'
require_relative '../../lib/RockPaperScissorsGame/RPS_score_count'



# directs to views/string_segmenter.erb. 
# @available_dictionary calls on available_dictionary() method in lib/dictionary.rb
MyApp.get "/RockPaperScissors/Players" do
  erb :"/RockPaperScissors/Players"
end

class MyApp
  get '/RockPaperScissors/WeaponChoice' do
  @game = Game.new(params[:max_games], params[:player_name], params[:other_player_name])
  erb :"/RockPaperScissors/WeaponChoice"
  end
end