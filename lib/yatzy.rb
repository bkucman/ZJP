class Yatzy
  def self.chance(die)
    die.sum
  end

  def self.yatzy(dice)
    counts = [0] * (dice.length + 1)
    dice.each do |die|
      counts[die - 1] += 1
    end
    (0...counts.size).each do |i|
      return 50 if counts[i] == 5
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

  def self.score_pair( d1,  d2,  d3,  d4,  d5)
    counts = [0]*6
    counts[d1-1] += 1
    counts[d2-1] += 1
    counts[d3-1] += 1
    counts[d4-1] += 1
    counts[d5-1] += 1
    (0...6).each do |i|
      return (6-i) * 2 if counts[6-i-1] >= 2
    end
    0
  end

  def self.two_pair( d1,  d2,  d3,  d4,  d5)
    counts = [0]*6
    counts[d1-1] += 1
    counts[d2-1] += 1
    counts[d3-1] += 1
    counts[d4-1] += 1
    counts[d5-1] += 1
    n = 0
    score = 0
    (Array 0..5).each do |i|
      (n += 1; score += (6 - i)) if counts[6 - i - 1] >= 2
    end

    if n == 2
      return score * 2
    else
      return 0
    end
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
    (0..6).each do |i|
      return (i + 1) * number if tallies[i] >= number
    end
    0
  end

  def self.smallStraight(die)
    tallies = set_tallies(die)
    all_ones = true
    tallies.each do |i|
      all_ones = false if tallies[i] != 1
    end
    (all_ones) ? 15 : 0
  end

  def self.largeStraight(die)
    tallies = set_tallies(die)
    all_ones = true
    tallies.each do |i|
      all_ones = false if tallies[i+1] != 1
    end
    (all_ones) ? 20 : 0
  end

  def self.fullHouse( d1,  d2,  d3,  d4,  d5)
    tallies = []
    _2 = false
    i = 0
    _2_at = 0
    _3 = false
    _3_at = 0

    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    (0..6).each do |i|
      (_2 = true; _2_at = i + 1) if tallies[i] == 2
    end

    (0..6).each do |i|
      (_3 = true; _3_at = i + 1) if tallies[i] == 3
    end

    if _2 && _3
      return _2_at * 2 + _3_at * 3
    else
      return 0
    end
  end
end