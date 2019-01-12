require_relative '../lib/yatzy'
require_relative '../lib/dice'
require 'test/unit'

# Yatzy rules verificator tests
class YatzyTest < Test::Unit::TestCase
  def test_chance_scores
    assert_equal 15, Yatzy.chance(Dice.new(2, 3, 4, 5, 1).faces)
    assert_equal 16, Yatzy.chance(Dice.new(3, 3, 4, 5, 1).faces)
  end

  def test_yatzy_scores
    assert_equal 50, Yatzy.yatzy(Dice.new(4, 4, 4, 4, 4).faces)
    assert_equal 50, Yatzy.yatzy(Dice.new(6, 6, 6, 6, 6).faces)
    assert_equal 0, Yatzy.yatzy(Dice.new(6, 6, 6, 6, 3).faces)
  end

  def test_1s_scores
    assert_equal 0, Yatzy.count_number(Dice.new(6, 2, 2, 4, 5).faces, 1)
    assert_equal 1, Yatzy.count_number(Dice.new(1, 2, 3, 4, 5).faces, 1)
    assert_equal 2, Yatzy.count_number(Dice.new(1, 2, 1, 4, 5).faces, 1)
    assert_equal 4, Yatzy.count_number(Dice.new(1, 2, 1, 1, 1).faces, 1)
  end

  def test_2s_scores
    assert_equal 4, Yatzy.count_number(Dice.new(1, 2, 3, 2, 6).faces, 2)
    assert_equal 10, Yatzy.count_number(Dice.new(2, 2, 2, 2, 2).faces, 2)
  end

  def test_threes_scores
    assert_equal 6, Yatzy.count_number(Dice.new(1, 2, 3, 2, 3).faces, 3)
    assert_equal 12, Yatzy.count_number(Dice.new(2, 3, 3, 3, 3).faces, 3)
  end

  def test_fours_scores
    assert_equal 12, Yatzy.count_number(Dice.new(4, 4, 4, 5, 5).faces, 4)
    assert_equal 8, Yatzy.count_number(Dice.new(4, 4, 5, 5, 5).faces, 4)
    assert_equal 4, Yatzy.count_number(Dice.new(4, 5, 5, 5, 5).faces, 4)
  end

  def test_fives_scores
    assert_equal 10, Yatzy.count_number(Dice.new(4, 4, 4, 5, 5).faces, 5)
    assert_equal 15, Yatzy.count_number(Dice.new(4, 4, 5, 5, 5).faces, 5)
    assert_equal 20, Yatzy.count_number(Dice.new(4, 5, 5, 5, 5).faces, 5)
  end

  def test_sixes_scores
    assert_equal 0, Yatzy.count_number(Dice.new(4, 4, 4, 5, 5).faces, 6)
    assert_equal 6, Yatzy.count_number(Dice.new(4, 4, 6, 5, 5).faces, 6)
    assert_equal 18, Yatzy.count_number(Dice.new(6, 5, 6, 6, 5).faces, 6)
  end

  def test_one_pair_scores
    assert_equal 6, Yatzy.score_pair(Dice.new(3, 4, 3, 5, 6).faces)
    assert_equal 10, Yatzy.score_pair(Dice.new(5, 3, 3, 3, 5).faces)
    assert_equal 12, Yatzy.score_pair(Dice.new(5, 3, 6, 6, 5).faces)
  end

  def test_two_pair_scores
    assert_equal 16, Yatzy.two_pair(Dice.new(3, 3, 5, 4, 5).faces)
    assert_equal 16, Yatzy.two_pair(Dice.new(3, 3, 5, 5, 5).faces)
  end

  def test_three_of_a_kind_scores
    assert_equal 9, Yatzy.number_of_a_kind(Dice.new(3, 3, 3, 4, 5).faces, 3)
    assert_equal 9, Yatzy.number_of_a_kind(Dice.new(3, 3, 3, 3, 5).faces, 3)
    assert_equal 9, Yatzy.number_of_a_kind(Dice.new(3, 3, 3, 3, 3).faces, 3)
    assert_equal 15, Yatzy.number_of_a_kind(Dice.new(5, 3, 5, 4, 5).faces, 3)
  end

  def test_four_of_a_kind_scores
    assert_equal 12, Yatzy.number_of_a_kind(Dice.new(3, 3, 3, 3, 5).faces, 4)
    assert_equal 20, Yatzy.number_of_a_kind(Dice.new(5, 5, 5, 4, 5).faces, 4)
    assert_equal 12, Yatzy.number_of_a_kind(Dice.new(3, 3, 3, 3, 3).faces, 4)
  end

  def test_small_straight_scores
    assert_equal 15, Yatzy.small_straight(Dice.new(1, 2, 3, 4, 5).faces)
    assert_equal 15, Yatzy.small_straight(Dice.new(2, 3, 4, 5, 1).faces)
    assert_equal 0, Yatzy.small_straight(Dice.new(1, 2, 2, 4, 5).faces)
  end

  def test_large_straight_scores
    assert_equal 20, Yatzy.large_straight(Dice.new(6, 2, 3, 4, 5).faces)
    assert_equal 20, Yatzy.large_straight(Dice.new(2, 3, 4, 5, 6).faces)
    assert_equal 0, Yatzy.large_straight(Dice.new(1, 2, 2, 4, 5).faces)
  end

  def test_full_house_scores
    assert_equal 18, Yatzy.full_house(Dice.new(6, 2, 2, 2, 6).faces)
    assert_equal 0, Yatzy.full_house(Dice.new(2, 3, 4, 5, 6).faces)
  end
end
