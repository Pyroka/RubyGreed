module RubyGreed
  class Roll
    attr_reader :values

    def initialize(values)
      @values = values
    end

    def score
      rollToCounts = Hash.new(0)
      @values.each { |value| rollToCounts[value] += 1 }

      score = score_triple(rollToCounts, 1, 1000)
      for die in (2..6)
        score += score_triple(rollToCounts, die, die * 100)
      end
      score += (rollToCounts[1] * 100)
      score + (rollToCounts[5] * 50)
    end

    private

    def score_triple(rollToCounts, index, score)
      if rollToCounts[index] >= 3
        rollToCounts[index] -= 3
        return score
      end
      return 0
    end
  end
end