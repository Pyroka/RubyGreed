module RubyGreed
  class Game
    MINIMUM_SCORE_TO_GET_IN_GAME = 300
    SCORE_THAT_TRIGGERS_FINAL_ROUND = 3000

    attr_reader :winner

    def initialize(players)
      @players = players
      @winner = nil
      @current_player_idx = 0
      @current_turn = Turn.new
    end

    def roll(number_of_dice)
      add_score(Roll.from_dice(number_of_dice))
    end

    def add_score(score)
      @current_turn.add_score(score)
      if @current_turn.ended
        end_turn
      end
    end

    def current_player
      @players[@current_player_idx]
    end

    def end_turn
      current_player.add_score(@current_turn.score)
      next_player
    end

    private

    def next_player
      if game_has_winner
        @winner = current_player
        @current_turn = nil
      else
        @current_player_idx = (@current_player_idx + 1) % @players.length
        @current_turn = Turn.new
      end
    end

    def game_has_winner
      is_on_last_player = @current_player_idx == @players.length - 1
      in_final_round = @players.any? { |player| player.score >= SCORE_THAT_TRIGGERS_FINAL_ROUND }
      return is_on_last_player && in_final_round
    end

  end
end