require File.dirname(__FILE__) + '/game'

module RubyGreed
  class Player
    attr_reader :score

    def initialize
      @score = 0
      @in_game = false
    end

    def add_score(score)
      if @in_game || score >= Game::MINIMUM_SCORE_TO_GET_IN_GAME
        @score += score
        @in_game = true
      end
    end

  end
end