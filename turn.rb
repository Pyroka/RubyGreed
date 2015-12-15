module RubyGreed
  class Turn
    attr_reader :score
    attr_reader :ended

    def initialize
      @score = 0
      @ended = false
    end

    def add_score(score)
      if score == 0
        @ended = true
        @score = 0
      else
        @score += score
      end
    end

  end
end