require 'test/unit'
require File.expand_path('../turn')

module RubyGreed
  class TurnTest < Test::Unit::TestCase

    def test_score_starts_at_zero
      assert_equal(0, Turn.new.score)
    end

    def test_add_roll_adds_score
      turn = Turn.new
      roll = Roll.new([1, 2, 3, 4, 5])

      turn.add_roll(roll)
      turn.add_roll(roll)

      assert_equal(roll.score * 2, turn.score)
    end

    def test_turn_starts_not_ended
      assert_equal(false, Turn.new.ended)
    end

    def test_add_roll_with_no_dice_for_next_roll_ends_turn
      roll = Roll.new([2, 3, 4, 6])
      assert_equal(0, roll.num_dice_for_next_roll)
      turn = Turn.new

      turn.add_roll(roll)

      assert_equal(true, turn.ended)
    end

    def test_add_roll_with_no_score_sets_turn_score_to_zero
      roll_with_score = Roll.new([1, 1, 1, 5, 5])
      roll_with_no_score = Roll.new([2, 3, 4, 6])
      turn = Turn.new

      turn.add_roll(roll_with_score)
      assert_equal(roll_with_score.score, turn.score)

      turn.add_roll(roll_with_no_score)

      assert_equal(0, turn.score)
    end

  end
end