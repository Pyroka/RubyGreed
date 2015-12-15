require 'test/unit'
require File::expand_path('../game')

module RubyGreed
  class GameTest < Test::Unit::TestCase

    def test_game_starts_off_with_no_winner
      game = Game.new([Player.new, Player.new])

      assert_nil(game.winner)
    end

    def test_game_starts_with_player_one
      players = [Player.new, Player.new]
      game = Game.new(players)

      assert_same(players.first, game.current_player)
    end

    def test_game_switches_to_next_player_when_turn_ends
      players = [Player.new, Player.new]
      game = Game.new(players)

      game.end_turn

      assert_equal(players.last, game.current_player)
    end

    def test_game_adds_turn_score_to_player_score_when_turn_ends
      players = [Player.new, Player.new]
      game = Game.new(players)

      game.add_score(Game::MINIMUM_SCORE_TO_GET_IN_GAME)
      game.end_turn

      assert_equal(Game::MINIMUM_SCORE_TO_GET_IN_GAME, players.first.score)
    end

    def test_winner_is_player_with_most_score_after_last_round
      players = [Player.new, Player.new]
      game = Game.new(players)

      game.add_score(Game::SCORE_THAT_TRIGGERS_FINAL_ROUND)
      game.end_turn
      game.add_score(Game::SCORE_THAT_TRIGGERS_FINAL_ROUND + 1)
      game.end_turn

      assert_same(players.last, game.winner)
    end

  end
end