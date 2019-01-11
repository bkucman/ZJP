class Yatzy
  def self.chance(die)
    die.sum
  end

  def self.yatzy(dice)
    numbers_of_values = [0] * (dice.length + 1)
    dice.each do |die|
      numbers_of_values[die - 1] += 1
    end
    (0...numbers_of_values.size).each do |i|
      return 50 if numbers_of_values[i] == 5
    end
    0
  end

  def self.count_number(die, number)
    sum = 0
    die.each do |die|
      sum += number if die == number
    end
    sum
  end

  def initialize(die)
    @dice = die
  end

  def self.score_pair(die)
    numbers_of_values = set_numbers_of_values(die)
    (0..6).each do |i|
      return (6-i) * 2 if numbers_of_values[6-i-1] >= 2
    end
    0
  end

  def self.two_pair(die)
    numbers_of_values = set_numbers_of_values(die)
    n = 0
    score = 0
    numbers_of_values.each_with_index do |i,ind|
      (n += 1; score += (ind + 1)) if i >= 2
    end
    return score * 2 if n == 2
    0
  end

  def self.set_numbers_of_values(die)
    numbers_of_values = [0]*6
    (0..4).each do |i|
      numbers_of_values[die[i] - 1] += 1
    end
    numbers_of_values
  end

  def self.number_of_a_kind(die, number)
    numbers_of_values = set_numbers_of_values(die)
    (0..6).each do |i|
      return (i + 1) * number if numbers_of_values[i] >= number
    end
    0
  end

  def self.smallStraight(die)
    numbers_of_values = set_numbers_of_values(die)
    all_ones = true
    numbers_of_values.each do |i|
      all_ones = false if numbers_of_values[i] != 1
    end
    (all_ones) ? 15 : 0
  end

  def self.largeStraight(die)
    numbers_of_values = set_numbers_of_values(die)
    all_ones = true
    numbers_of_values.each do |i|
      all_ones = false if numbers_of_values[i+1] != 1
    end
    (all_ones) ? 20 : 0
  end

  def self.find_number(tallies, number)
    (0..6).each do |i|
      return i + 1 if tallies[i] == number
    end
    0
  end

  def self.fullHouse(die)
    numbers_of_values = set_numbers_of_values(die)
    (find_number(numbers_of_values, 2) * 2 + find_number(numbers_of_values, 3) * 3)
  end
end
