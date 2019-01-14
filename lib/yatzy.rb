# Yatzy score verificator
class Yatzy
  def self.chance(faces)
    faces.sum
  end

  def self.yatzy(faces)
    tallies = get_tallies(faces)
    tallies.each do |amount|
      return 50 if amount == 5
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
    (1..6).reverse_each do |number|
      return number * 2 if tallies[number] >= 2
    end
    0
  end

  def self.score_two_pair(faces)
    tallies = get_tallies(faces)
    pairs = 0; score = 0
    tallies.each_with_index do |amount, number|
      if amount >= 2
        pairs += 1
        score += number
      end
    end
    return score * 2 if pairs == 2
    0
  end

  def self.get_tallies(faces)
    tallies = [0] * 7
    (0..4).each do |i|
      tallies[faces[i]] += 1
    end
    tallies
  end

  def self.number_of_a_kind(faces, number)
    tallies = get_tallies(faces)
    tallies.each_with_index do |amount, number_tallies|
      return number_tallies * number if amount >= number
    end
    0
  end

  def self.small_straight(faces)
    tallies = get_tallies(faces)
    (1..5).each do |face|
      return 0 if tallies[face] != 1
    end
    15
  end

  def self.large_straight(faces)
    tallies = get_tallies(faces)
    (2..6).each do |face|
      return 0 if tallies[face] != 1
    end
    20
  end

  def self.full_house(faces)
    tallies = get_tallies(faces)
    find_number(tallies, 2) * 2 + find_number(tallies, 3) * 3
  end

  def self.find_number(tallies, number)
    tallies.each_with_index do |amount, number_tallies|
      return number_tallies if amount == number
    end
    0
  end
end
