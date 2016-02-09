class Score_count

  # @score_count: Instance Variable assigned an Integer value used to track the number of games won by Player One.
  # @games_tied: Isntance Variable assigned an Integer value used to track the number of tied games.
  # @other_score_count: Instance Variable assigned an Integer value used to track the number of games won by Player Two.
  # @set_winner: Instance Variable assigned an Integer value based on the outcome of set_determine_set_winner Method.
  def initialize()
    @score_count = 0
    @games_tied = 0
    @other_score_count = 0
    @set_winner = 0
  end

  # Method increases Integer value of Instance Variable @score_count by 1 
  # Increases number of games won for Player One
  def set_games_won()
    @score_count += 1
  end

  # RETURNS Integer value of Instance Variable @score_count (Games won by Player One)
  def get_games_won()
    return @score_count
  end

  # Method increases Integer value of Instance Variable @other_score_count by 1 
  # Increases number of games won for Player Two
  def set_other_games_won()
     @other_score_count += 1
  end

  # RETURNS Integer value of Instance Variable @other_score_count (Games won by Player Two)
  def get_other_games_won()
     return @other_score_count
  end

  # Method increases Integer value of Instance Variable @games_tied by 1 
  # Increases the number of tied games.
  def set_games_tied()
    @games_tied += 1
  end

  # RETURNS Integer value of Instance Variable @games_tied (Games tied by players)
  def get_games_tied()
    return @games_tied
  end

  # algorithmic Method usng Conditional to compare the number of games won by each player
  # as well as the number of tied games. SETS an Integer value based on this. 
  #
  # @score_count: Instance Variable. value = Integer used to track the number of games won by Player One.
  # @other_score_count: Instance Variable. value = Integer used to track the number of games won by Player Two.
  # @set_winner: Instance Variable assigned an Integer value based on the outcome of the conditional statement
  #  1 = Player One Wins, 2 = Player Two Wins, 0 = Tie Game 
  #
  # SETS Integer Value for @set_winner Instance Variable. 
  def set_determine_set_winner()
    if @score_count > @other_score_count
          @set_winner = 1

    elsif @score_count < @other_score_count
          @set_winner = 2
            
    else @score_count == @other_score_count
          @set_winner = 0
    end
  end

 # RETURNS Integer Value for @set_winner Instance Variable. 
  def get_determine_set_winner()
   return @set_winner
  end

## START: METHODS FOR TESTS ##

  # RETURNS method Integer variable as @score_count Instance Variable for testing purposes  
  def set_games_won_for_tests(num)
    @score_count = num
  end

  # RETURNS method Integer variable as @other_score_count Instance Variable for testing purposes  
  def set_other_games_won_for_tests(num)
     @other_score_count = num
  end

end
