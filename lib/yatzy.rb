# Yatzy score verificator
class Yatzy
  def self.chance(faces)
    faces.sum
  end

  def self.yatzy(faces)
    tallies = get_tallies(faces)
    (0..tallies.size).each do |i|
      return 50 if tallies[i] == 5
    end
    0
  end

  def self.sum_number(faces, number)
    sum = 0
    faces.each do |face|
      sum += number if face == number
    end
    sum
  end

  def self.score_pair(faces)
    tallies = get_tallies(faces)
    (0...tallies.size).reverse_each do |number|
      return (number + 1) * 2 if tallies[number] >= 2
    end
    0
  end

  def self.score_two_pair(faces)
    tallies = get_tallies(faces)
    pair_amount = 0; score = 0
    tallies.each_with_index do |number_amount, number|
      if number_amount >= 2
        pair_amount += 1
        score += number + 1
      end
    end
    return score * 2 if pair_amount == 2
    0
  end

  def self.get_tallies(faces)
    tallies = [0] * 6
    (0..4).each do |i|
      tallies[faces[i] - 1] += 1
    end
    tallies
  end

  def self.number_of_a_kind(faces, number)
    tallies = get_tallies(faces)
    (0..tallies.size).each do |amount|
      return (amount + 1) * number if tallies[amount] >= number
    end
    0
  end

  def self.small_straight(faces)
    tallies = get_tallies(faces)
    tallies.each do |amount|
      return 0 if tallies[amount] != 1
    end
    15
  end

  def self.large_straight(faces)
    tallies = get_tallies(faces)
    tallies.each do |amount|
      return 0 if tallies[amount + 1] != 1
    end
    20
  end

  def self.full_house(faces)
    tallies = get_tallies(faces)
    find_number(tallies, 2) * 2 + find_number(tallies, 3) * 3
  end

  def self.find_number(tallies, number)
    (0..tallies.size).each do |amount|
      return amount + 1 if tallies[amount] == number
    end
    0
  end
end
