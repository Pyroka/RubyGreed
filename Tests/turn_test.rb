require 'test/unit'
require File.expand_path('../turn')

module RubyGreed
  class TurnTest < Test::Unit::TestCase

    def test_score_starts_at_zero
      assert_equal(0, Turn.new.score)
    end

    def test_add_score_adds_score
      turn = Turn.new

      turn.add_score(100)
      turn.add_score(200)

      assert_equal(300, turn.score)
    end

    def test_turn_starts_not_ended
      assert_equal(false, Turn.new.ended)
    end

    def test_add_zero_score_ends_turn_and_sets_turn_score_to_zero
      turn = Turn.new

      turn.add_score(0)

      assert_equal(true, turn.ended)
      assert_equal(0, turn.score)
    end

  end
end