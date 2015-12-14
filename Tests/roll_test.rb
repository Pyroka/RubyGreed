require 'test/unit'
require '../roll'

module RubyGreed
  class RollTest < Test::Unit::TestCase

    def test_initialize_with_values_stores_values
      roll = Roll.new([1, 2, 3])

      assert_equal([1, 2, 3], roll.values)
    end

    

  end
end