require_relative '../lib/yatzy'
require_relative '../lib/dice'
require 'test/unit'

# Yatzy rules verificator tests
class YatzyTest < Test::Unit::TestCase
  def test_chance_scores_sum_of_all_dice
    expected = 15
    dice = Dice.new(2, 3, 4, 5, 1)
    actual = Yatzy.chance(dice.return_dice)
    assert expected == actual
    assert Yatzy.chance(Dice.new(3, 3, 4, 5, 1).return_dice) == 16
  end

  def test_yatzy_scores_50
    expected = 50
    actual = Yatzy.yatzy([4, 4, 4, 4, 4])
    assert expected == actual
    assert_equal 50, Yatzy.yatzy([6, 6, 6, 6, 6])
    assert_equal 0, Yatzy.yatzy([6, 6, 6, 6, 3])
  end

  def test_1s
    assert_equal 0, Yatzy.count_number(Dice.new(6, 2, 2, 4, 5).return_dice, 1)
    assert_equal 1, Yatzy.count_number(Dice.new(1, 2, 3, 4, 5).return_dice, 1)
    assert_equal 2, Yatzy.count_number(Dice.new(1, 2, 1, 4, 5).return_dice, 1)
    assert_equal 4, Yatzy.count_number(Dice.new(1, 2, 1, 1, 1).return_dice, 1)
  end

  def test_2s
    assert_equal 4, Yatzy.count_number(Dice.new(1, 2, 3, 2, 6).return_dice, 2)
    assert_equal 10, Yatzy.count_number(Dice.new(2, 2, 2, 2, 2).return_dice, 2)
  end

  def test_threes
    assert_equal 6, Yatzy.count_number(Dice.new(1, 2, 3, 2, 3).return_dice, 3)
    assert_equal 12, Yatzy.count_number(Dice.new(2, 3, 3, 3, 3).return_dice, 3)
  end

  def test_fours_test
    assert_equal 12, Yatzy.count_number(Dice.new(4, 4, 4, 5, 5).return_dice, 4)
    assert_equal 8, Yatzy.count_number(Dice.new(4, 4, 5, 5, 5).return_dice, 4)
    assert_equal 4, Yatzy.count_number(Dice.new(4, 5, 5, 5, 5).return_dice, 4)
  end

  def test_fives()
    assert_equal 10, Yatzy.count_number(Dice.new(4, 4, 4, 5, 5).return_dice, 5)
    assert_equal 15, Yatzy.count_number(Dice.new(4, 4, 5, 5, 5).return_dice, 5)
    assert_equal 20, Yatzy.count_number(Dice.new(4, 5, 5, 5, 5).return_dice, 5)
  end

  def test_sixes_test
    assert_equal 0, Yatzy.count_number(Dice.new(4, 4, 4, 5, 5).return_dice, 6)
    assert_equal 6, Yatzy.count_number(Dice.new(4, 4, 6, 5, 5).return_dice, 6)
    assert_equal 18, Yatzy.count_number(Dice.new(6, 5, 6, 6, 5).return_dice, 6)
  end

  def test_one_pair
    assert_equal 6, Yatzy.score_pair(Dice.new(3, 4, 3, 5, 6).return_dice)
    assert_equal 10, Yatzy.score_pair(Dice.new(5, 3, 3, 3, 5).return_dice)
    assert_equal 12, Yatzy.score_pair(Dice.new(5, 3, 6, 6, 5).return_dice)
  end

  def test_two_pair
    assert_equal 16, Yatzy.two_pair(Dice.new(3, 3, 5, 4, 5).return_dice)
    assert_equal 16, Yatzy.two_pair(Dice.new(3, 3, 5, 5, 5).return_dice)
  end

  def test_three_of_a_kind
    assert_equal 9, Yatzy.number_of_a_kind(Dice.new(3, 3, 3, 4, 5).return_dice, 3)
    assert_equal 15, Yatzy.number_of_a_kind(Dice.new(5, 3, 5, 4, 5).return_dice, 3)
    assert_equal 9, Yatzy.number_of_a_kind(Dice.new(3, 3, 3, 3, 5).return_dice, 3)
    assert_equal 9, Yatzy.number_of_a_kind(Dice.new(3, 3, 3, 3, 3).return_dice, 3)
  end

  def test_four_of_a_kind
    assert_equal 12, Yatzy.number_of_a_kind(Dice.new(3, 3, 3, 3, 5).return_dice, 4)
    assert_equal 20, Yatzy.number_of_a_kind(Dice.new(5, 5, 5, 4, 5).return_dice, 4)
    assert_equal 12, Yatzy.number_of_a_kind(Dice.new(3, 3, 3, 3, 3).return_dice, 4)
  end

  def test_small_straight
    assert_equal 15, Yatzy.small_straight(Dice.new(1, 2, 3, 4, 5).return_dice)
    assert_equal 15, Yatzy.small_straight(Dice.new(2, 3, 4, 5, 1).return_dice)
    assert_equal 0, Yatzy.small_straight(Dice.new(1, 2, 2, 4, 5).return_dice)
  end

  def test_large_straight
    assert_equal 20, Yatzy.large_straight(Dice.new(6, 2, 3, 4, 5).return_dice)
    assert_equal 20, Yatzy.large_straight(Dice.new(2, 3, 4, 5, 6).return_dice)
    assert_equal 0, Yatzy.large_straight(Dice.new(1, 2, 2, 4, 5).return_dice)
  end

  def test_full_house
    assert_equal 18, Yatzy.full_house(Dice.new(6, 2, 2, 2, 6).return_dice)
    assert_equal 0, Yatzy.full_house(Dice.new(2, 3, 4, 5, 6).return_dice)
  end
end
