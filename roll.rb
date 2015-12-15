module RubyGreed
  class Roll
    attr_reader :score
    attr_reader :num_dice_for_next_roll

    def initialize(values)
      roll_to_counts = Hash.new(0)
      values.each { |value| roll_to_counts[value] += 1 }

      @score = calculate_score(roll_to_counts)
      @num_dice_for_next_roll = calculate_num_dice_for_next_roll(values)
    end

    private

    def calculate_score(roll_to_counts)
      score = score_triple(roll_to_counts, 1, 1000)
      (2..6).each { |die| score += score_triple(roll_to_counts, die, die * 100) }
      score += (roll_to_counts[1] * 100)
      score + (roll_to_counts[5] * 50)
    end

    def calculate_num_dice_for_next_roll(values)
      values_that_scored = values.select { |value| is_scoring_value(value) }
      case values_that_scored.length
        when values.length
          values.length
        when 0
          0
        else
          values.length - values_that_scored.length
      end
    end

    def is_scoring_value(value)
      value == 1 || value == 5
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