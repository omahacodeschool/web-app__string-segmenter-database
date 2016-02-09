require_relative 'RPS_score_count'

class Game

  # Sets global variables to linked classes.
  def initialize(max_games, player_name, other_player_name)
    @score_count = Score_count.new()
    @player_name = player_name
    @other_player_name = other_player_name
    @max_games = max_games
    @played_games = 0
    @weapon = ""
    @other_weapon = ""
    @battle_result = 0
  end

## START: GAME FUNCTIONALITY METHODS ##
  #
  # Method that runs the full RPS game for two players. 
  #
  # 'Set_max_games' Method is located in Players class > getter and setter method are linked in Game class for faster access.
  # 'name_all_players' Method is located in Players class > getter and setter method are linked in Game class for faster access.
  # 'play_through_set_of_games' Method is another game functionality Method for handling match gameplay. Found in the Game class. Use puts to return Strings generated from other method.
  # 'set_determine_set_winner' Method is located in Score_Count class. Determines overall winner based on number of games played.
  # 'overall_winner_message' Method is set in Game Class in Messages section. Returns overall victory message depending on which player won. 
  #
  # RETURNS entire game functionality + necessary text notifications throughout entire set of games + final result notification. 
  def run_full_game()
    set_max_games()
    name_all_players()
    puts play_through_set_of_games()
    set_determine_set_winner()
    puts overall_winner_message()
  end

  # Method that loops through gameplay process based on the number of games the user wants to play.

  # get_played_games: Method is located in Players class > getter and setter method are linked in Game class for faster access. Returns number of played games thusfar.
  # get_max_games: Method is located in Players class > getter and setter method are linked in Game class for faster access. Returns number of max games to play, as declared by the user in another method
  # reset_player_weapons: Method is located in Players class > getter and setter method are linked in Game class for faster access. Forces the players to select new weapons at the start of each match. 
  # set_battle: Method is located in Players class > getter and setter method are linked in Game class for faster access. Determines match outcome based on weapons selected by each player
  # battle_outcome: Method located in Players section--but not directly linked to Player class. Modifies user or tie score and returns notification based on get_battle Method result.
  # set_played_games: Method is located in Players class > getter and setter method are linked in Game class for faster access. Increases the number of played games by 1 for each game played.
  #
  #RETURNS single match functionality, user score, and game notifications
  def play_through_set_of_games()
    while get_played_games() < get_max_games() do
      reset_player_weapons()
      set_battle()
      puts battle_outcome()
      set_played_games()
    end
  end
## END: GAME FUNCTIONALITY METHODS


## START: PLAYERS SELECTION METHODS

  # SETS user String input to value of max number of RPS games to play. Converts to Integer
  def set_max_games(max_games)
    @max_games = max_games
  end

 # RETURNS Integer value of Instance Variable @max_games (total number of games to be played)
  def get_max_games()
    return @max_games
  end

  # SETS Integer defining number of games that have been finished by players. 
  # Adds +1 to @played_games current value each time method is called.
  def set_played_games()
    @played_games += 1
  end

  # RETURNS Integer value of Instance Variable @played_games (Games completed by players)
  def get_played_games()
    return @played_games
  end

  # SET String containing Player One's name, based on user input.
  def set_name(player_name)
    @player_name = player_name
  end

  # RETURN String value of Instance Variable @player_name (Player One's name)
  def get_name()
    return @player_name
  end

  # SET String containing Player Two's name, based on user input.
  def set_other_name(other_name)
     @other_player_name = other_name
  end

  # RETURN String value of Instance Variable @other_player_name (Player Two's name)
  def get_other_name()
    return @other_player_name
  end

  # Method RETURNS set_name Method, followed by set_other_name Method, in order to set the name Strings of both players. 
  def name_all_players()
    set_name()
    set_other_name()
  end

  # Method SETS String containing Player One's weapon selection--based on user input.
  # weapon: local variable with String value. Contains user input
  # case weapon: Case Conditional to check value of local variable.
    # If user input does not match available options, it will put a string message
    # and trigger the prompt to select a weapon again, by setting the value of weapon equal to the set_weapon() Method.
  def set_weapon(weapon)
    @weapon = weapon
  end

  # RETURN String value of Instance Variable @weapon (Player One's Weapon)
  def get_weapon()
    return @weapon
  end

  # Method SETS String containing Player Two's weapon selection--based on user input.
  # other_weapon: local variable with String value. Contains user input
  # case other_weapon: Case Conditional to check value of local variable.
    # If user input does not match available options, it will put a string message
    # and trigger the prompt to select a weapon again, by setting the value of other_weapon equal to the set__other_weapon() Method.
  def set_other_weapon(other_weapon)
    @other_weapon = other_weapon
  end

  # RETURN String value of Instance Variable @other_weapon (Player Two's Weapon)
  def get_other_weapon()
    return @other_weapon
  end

  # Method calls set_weapon Method, followed by set_other_weapon Method
  # to set a new String value to each corresponding instance variable. 
  def reset_player_weapons()
     set_weapon()
     set_other_weapon()
  end

  # Alorithmic Method using Conditional to compare player weapons. SETS Integer value based on outcome of the conditional.
  # 1 = Player One Wins, 2 = Player Two Wins, 0 = Tie Game 
  def set_battle()
    if ((@weapon == "scissors") && (@other_weapon == "paper")) || ((@weapon == "rock") &&  (@other_weapon == "scissors")) || ((@weapon == "paper") && (@other_weapon == "rock"))
      @battle_result = 1
    
    elsif ((@weapon == "rock") && (@other_weapon == "paper")) || ((@weapon == "scissors") && (@other_weapon == "rock")) || ((@weapon == "paper") && (@other_weapon == "scissors"))
      @battle_result = 2 

    else
      @weapon == @other_weapon 
      @battle_result = 0
    end
  end

# RETURN Integer value of Instance Variable @battle_result (Determines which player won an RPS match)
  def get_battle()
     @battle_result = set_battle()
  end

  # Conditional Method using Integer returned in get_battle method to determine 
  # which Score_Count Class Method and game messages Game Class Methods to call.
  #
  # set_games_won: Method that increases Player One game victory count by 1.
  # set_other_games_won: Method that increases Player Two game victory count by 1. 
  # set_games_tied: Method that increases tie count by 1
  # get_victory_confirmation: Method that returns a String, identifing Player One (along with the weapon used) as the winner.
  # get_other_loss_confirmation: Method that returns a String, identifing Player Two (along with the weapon used) as the loser.
  # get_loss_confirmation: Method that returns a String, identifing Player One (along with the weapon used) as the loser.
  # get_other_victory_confirmation: Method that returns a String, identifing Player Two (along with the weapon used) as the winner.
  # get_tie_confirmation: Method that returns a String, identifying that both players tied with Player One's weapon. 
  #
  # SETS player score & RETURNS outcome notification 
  def battle_outcome()
    if get_battle() == 1
      set_games_won()
      return get_victory_confirmation() + " " + get_other_loss_confirmation()

    elsif get_battle() == 2
      set_other_games_won()
      return get_loss_confirmation() + " " + get_other_victory_confirmation()

    else get_battle() == 0
      set_games_tied()
      return get_tie_confirmation()
    end
  end
## END: PLAYERS METHODS -> LINKED CLASS FROM RPS_Players.rb


## START: GAME SCORING METHODS -> LINKED CLASS FROM RPS_score_count.rb
  #
  # SET Player One game victory count (Integer) via increasing existing value by 1.
  # (Linked Class > RPS_score_count.rb) 
  def set_games_won()
    @score_count.set_games_won()
  end

  # RETURN Integer defining Player One's game victories. (Linked Class > RPS_score_count.rb)
  def get_games_won()
    return @score_count.get_games_won()
  end

  # SET Player Two game victory count (Integer) via increasing existing value by 1.
  # (Linked Class > RPS_score_count.rb) 
  def set_other_games_won()
     @score_count.set_other_games_won()
  end

  # RETURN Integer defining Player Two's game victories. (Linked Class > RPS_score_count.rb)
  def get_other_games_won()
     @score_count.get_other_games_won()
  end

  # SET tie count (Integer) via increasing existing value by 1.
  # (Linked Class > RPS_score_count.rb) 
  def set_games_tied()
    @score_count.set_games_tied
  end

  # RETURN Integer defining tie count. (Linked Class > RPS_score_count.rb) 
  def get_games_tied()
    return @score_count.get_games_tied
  end

  # algorithmic Method usng Conditional to compare the number of games won by each player
  # as well as the number of tied games. SETS an Integer value based on this. 
  #(Linked Class > RPS_score_count.rb) 
  def set_determine_set_winner()
    @score_count.set_determine_set_winner()
  end

  # RETURNS Integer based on result found in set_determine_set_winner. 
  # (Linked Class > RPS_score_count.rb) 
  def get_determine_set_winner()
    return @score_count.get_determine_set_winner()
  end
## END: GAME SCORING METHODS -> LINKED CLASS FROM RPS_score_count.rb
   

## START: TEXT-BASED NOTIFICATION METHODS 
  #
  # Conditonal Method that takes the Integer provided in get_determine_set_winner Method
  # and RETURNS a String based on what the value is.
  def overall_winner_message()
    if @score_count.get_determine_set_winner() == 1
    return "#{@player.get_name()} won the set of games with a score of #{@score_count.get_games_won()} vs. #{@score_count.get_other_games_won()}. Both players tied #{@score_count.get_games_tied} time(s)."

    elsif @score_count.get_determine_set_winner() == 2
      return "#{@player.get_other_name()} won the set of games with a score of #{@score_count.get_other_games_won()} vs. #{@score_count.get_games_won()}. Both players tied #{@score_count.get_games_tied} time(s)."
          
    else @score_count.get_determine_set_winner() == 0
      return "It was a tie, guys. You're both just super duper."
    end
  end

  # RETURNS String containing victory notification for Player One, along with the weapon used by the player.
  def get_victory_confirmation()
    return "#{@player.get_name()} wins with #{@player.get_weapon()}!"
  end

 # RETURNS String containing victory notification for Player Two, along with the weapon used by the player.
  def get_other_victory_confirmation()
    return "#{@player.get_other_name()} wins with #{@player.get_other_weapon()}!"
  end

 # RETURNS String containing loss notification for Player One, along with the weapon used by the player.
  def get_loss_confirmation()
    return "#{@player.get_name()} loses with #{@player.get_weapon()}!"
  end

 # RETURNS String containing loss notification for Player Two, along with the weapon used by the player.
  def get_other_loss_confirmation()
    return "#{@player.get_other_name()} loses with #{@player.get_other_weapon()}!"
  end

   # RETURNS String containing tie game notification, along with the weapon used by Player One.
  def get_tie_confirmation()
    return "Both players tie with #{@player.get_weapon()}!"
  end
## END: TEXT-BASED NOTIFICATION METHODS

end
