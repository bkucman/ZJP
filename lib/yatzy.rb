class Yatzy
  def self.chance(d1, d2, d3, d4, d5)
    total = 0
    total += d1
    total += d2
    total += d3
    total += d4
    total += d5
    return total
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

  def self.ones( d1,  d2,  d3,  d4,  d5)
    sum = 0
    if (d1 == 1)
      sum += 1
    end
    if (d2 == 1)
      sum += 1
    end
    if (d3 == 1)
      sum += 1
    end
    if (d4 == 1)
      sum += 1
    end
    if (d5 == 1)
      sum += 1
    end

    sum
  end

  def self.twos( d1,  d2,  d3,  d4,  d5)
    sum = 0
    if (d1 == 2)
      sum += 2
    end
    if (d2 == 2)
      sum += 2
    end
    if (d3 == 2)
      sum += 2
    end
    if (d4 == 2)
      sum += 2
    end
    if (d5 == 2)
      sum += 2
    end
    return sum
  end

  def self.threes( d1,  d2,  d3,  d4,  d5)
    s = 0
    if (d1 == 3)
      s += 3
    end
    if (d2 == 3)
      s += 3
    end
    if (d3 == 3)
      s += 3
    end
    if (d4 == 3)
      s += 3
    end
    if (d5 == 3)
      s += 3
    end
    return s
  end

  def initialize(d1, d2, d3, d4, _5)
    @dice = [0]*5
    @dice[0] = d1
    @dice[1] = d2
    @dice[2] = d3
    @dice[3] = d4
    @dice[4] = _5
  end

  def fours
    sum = 0
    (Array 0..4).each do |i|
      sum += 4 if @dice[i] == 4
    end
    sum
  end

  def fives()
    sum = 0
    (Range.new(0, @dice.size)).each do |i|
      sum += 5 if @dice[i] == 5
    end
    sum
  end

  def sixes
    sum = 0
    (0..@dice.length).each do |i|
      sum += 6 if @dice[i] == 6
    end
    sum
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

  def self.four_of_a_kind( _1,  _2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[_1-1] += 1
    tallies[_2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    (0..6).each do |i|
      return (i + 1) * 4 if tallies[i] >= 4
    end
    0
  end

  def self.three_of_a_kind( d1,  d2,  d3,  d4,  d5)
    t = [0]*6
    t[d1-1] += 1
    t[d2-1] += 1
    t[d3-1] += 1
    t[d4-1] += 1
    t[d5-1] += 1
    (0..6).each do |i|
      return (i + 1) * 3 if t[i] >= 3
    end
    0
  end

  def self.smallStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    (tallies[0] == 1 and
      tallies[1] == 1 and
      tallies[2] == 1 and
      tallies[3] == 1 and
      tallies[4] == 1) ? 15 : 0
  end

  def self.largeStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    if (tallies[1] == 1 and tallies[2] == 1 and tallies[3] == 1 and tallies[4] == 1 and tallies[5] == 1)
      return 20
    end
    return 0
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