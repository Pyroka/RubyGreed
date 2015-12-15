module RubyGreed
  class Roll
    def initialize(values)
      @roll_to_counts = Hash.new(0)
      values.each { |value| @roll_to_counts[value] += 1 }
    end

    def score
      score = score_triple(@roll_to_counts, 1, 1000)
      (2..6).each { |die| score += score_triple(@roll_to_counts, die, die * 100) }
      score += (@roll_to_counts[1] * 100)
      score + (@roll_to_counts[5] * 50)
    end

    def num_non_scoring_dice
      [2, 3, 4, 6].inject(0) { |sum, die| sum + @roll_to_counts[die] }
    end

    private

    def score_triple(rollToCounts, index, score)
      if rollToCounts[index] >= 3
        rollToCounts[index] -= 3
        score
      else
        0
      end
    end
  end
end