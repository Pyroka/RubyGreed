require 'test/unit'
require File.expand_path('../player')
require File.expand_path('../game')

module RubyGreed
  class PlayerTest < Test::Unit::TestCase
    def test_player_starts_of_with_no_score
      player = Player.new

      assert_equal(0, player.score)
    end

    def test_adding_first_score_less_than_minimum_score_does_not_add_score
      player = Player.new

      player.add_score(Game::MINIMUM_SCORE_TO_GET_IN_GAME - 1)

      assert_equal(0, player.score)
    end

    def test_adding_mimumum_first_score_adds_score
      player = Player.new

      player.add_score(Game::MINIMUM_SCORE_TO_GET_IN_GAME)

      assert_equal(Game::MINIMUM_SCORE_TO_GET_IN_GAME, player.score)
    end

    def test_adding_larger_than_minimum_score_adds_score
      player = Player.new

      player.add_score(Game::MINIMUM_SCORE_TO_GET_IN_GAME + 1)

      assert_equal(Game::MINIMUM_SCORE_TO_GET_IN_GAME + 1, player.score)
    end

    def test_once_player_is_in_game_scores_under_mimumum_are_counted
      player = Player.new

      player.add_score(Game::MINIMUM_SCORE_TO_GET_IN_GAME)
      player.add_score(Game::MINIMUM_SCORE_TO_GET_IN_GAME - 1)

      expected_score = Game::MINIMUM_SCORE_TO_GET_IN_GAME + Game::MINIMUM_SCORE_TO_GET_IN_GAME - 1
      assert_equal(expected_score, player.score)
    end
  end
end