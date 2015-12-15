require 'test/unit'
require '../roll'

module RubyGreed
  class RollTest < Test::Unit::TestCase

    def test_score_of_an_empty_list_is_zero
      assert_equal(0, Roll.new([]).score)
    end

    def test_score_of_a_single_roll_of_5_is_50
      assert_equal(50, Roll.new([5]).score)
    end

    def test_score_of_a_single_roll_of_1_is_100
      assert_equal(100, Roll.new([1]).score)
    end

    def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
      assert_equal(300, Roll.new([1, 5, 5, 1]).score)
    end

    def test_score_of_single_2s_3s_4s_and_6s_are_zero
      assert_equal(0, Roll.new([2, 3, 4, 6]).score)
    end

    def test_score_of_a_triple_1_is_1000
      assert_equal(1000, Roll.new([1, 1, 1]).score)
    end

    def test_score_of_other_triples_is_100x
      assert_equal(200, Roll.new([2, 2, 2]).score)
      assert_equal(300, Roll.new([3, 3, 3]).score)
      assert_equal(400, Roll.new([4, 4, 4]).score)
      assert_equal(500, Roll.new([5, 5, 5]).score)
      assert_equal(600, Roll.new([6, 6, 6]).score)
    end

    def test_score_of_mixed_is_sum
      assert_equal(250, Roll.new([2, 5, 2, 2, 3]).score)
      assert_equal(550, Roll.new([5, 5, 5, 5]).score)
      assert_equal(1100, Roll.new([1, 1, 1, 1]).score)
      assert_equal(1200, Roll.new([1, 1, 1, 1, 1]).score)
      assert_equal(1150, Roll.new([1, 1, 1, 5, 1]).score)
    end

    def test_num_non_scoring_dice_with_all_scoring_die_is_zero
      assert_equal(0, Roll.new([1, 1, 1, 5, 5]).num_non_scoring_dice)
    end

    def test_num_non_scoring_dice_with_scoring_die_is_not_zero
      assert_equal(2, Roll.new([1, 1, 1, 2, 3]).num_non_scoring_dice)
    end

  end
end