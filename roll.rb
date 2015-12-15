module RubyGreed
  class Roll
    attr_reader :score
    attr_reader :num_non_scoring_dice

    def initialize(values)
      roll_to_counts = Hash.new(0)
      values.each { |value| roll_to_counts[value] += 1 }

      @score = calculate_score(roll_to_counts)
      @num_non_scoring_dice = calculate_num_non_scoring_dice(roll_to_counts)
    end

    private

    def calculate_score(roll_to_counts)
      score = score_triple(roll_to_counts, 1, 1000)
      (2..6).each { |die| score += score_triple(roll_to_counts, die, die * 100) }
      score += (roll_to_counts[1] * 100)
      score + (roll_to_counts[5] * 50)
    end

    def calculate_num_non_scoring_dice(roll_to_counts)
      [2, 3, 4, 6].inject(0) { |sum, die| sum + roll_to_counts[die] }
    end

    def score_triple(roll_to_counts, index, score)
      if roll_to_counts[index] >= 3
        roll_to_counts[index] -= 3
        score
      else
        0
      end
    end
  end
end