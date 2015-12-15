module RubyGreed
  class Turn
    attr_reader :score
    attr_reader :ended

    def initialize
      @score = 0
      @ended = false
    end

    def add_roll(roll)
      @score += roll.score
      if roll.num_dice_for_next_roll == 0
        @ended = true
        @score = 0
      end
    end

  end
end