class Yatzy
  def self.chance(die)
    die.sum
  end

  def self.yatzy(dice)
    tallies = [0] * (dice.length + 1)
    dice.each do |i|
      tallies[i - 1] += 1
    end
    (0..tallies.size).each do |i|
      return 50 if tallies[i] == 5
    end
    0
  end

  def self.count_number(die, number)
    sum = 0
    die.each do |i|
      sum += number if i == number
    end
    sum
  end

  def initialize(die)
    @dice = die
  end

  def self.score_pair(die)
    tallies = set_tallies(die)
    (0...tallies.size).reverse_each do |i|
      return (i + 1) * 2 if tallies[i] == 2
    end
    0
  end

  def self.two_pair(die)
    tallies = set_tallies(die)
    n = 0; score = 0
    tallies.each_with_index do |i, ind|
      if i >= 2
        n += 1
        score += ind + 1
      end
    end
    return score * 2 if n == 2
    0
  end

  def self.set_tallies(die)
    tallies = [0]*6
    (0..4).each do |i|
      tallies[die[i] - 1] += 1
    end
    tallies
  end

  def self.number_of_a_kind(die, number)
    tallies = set_tallies(die)
    (0..tallies.size).each do |i|
      return (i + 1) * number if tallies[i] >= number
    end
    0
  end

  def self.small_straight(die)
    tallies = set_tallies(die)
    all_ones = true
    tallies.each do |i|
      all_ones = false if tallies[i] != 1
    end
    all_ones ? 15 : 0
  end

  def self.large_straight(die)
    tallies = set_tallies(die)
    all_ones = true
    tallies.each do |i|
      all_ones = false if tallies[i + 1] != 1
    end
    all_ones ? 20 : 0
  end

  def self.find_number(tallies, number)
    (0..tallies.size).each do |i|
      return i + 1 if tallies[i] == number
    end
    0
  end

  def self.full_house(die)
    tallies = set_tallies(die)
    find_number(tallies, 2) * 2 + find_number(tallies, 3) * 3
  end
end
