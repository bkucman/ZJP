require_relative '../lib/yatzy'
require_relative '../lib/dice'
require 'test/unit'

class YatzyTest < Test::Unit::TestCase
  def test_chance_scores_sum_of_all_dice
    expected = 15
    dice = Dice.new(2,3,4,5,1)
    actual = Yatzy.chance(dice.return_dice())
    assert expected == actual
    assert 16 == Yatzy.chance(Dice.new(3,3,4,5,1).return_dice())
  end

  def test_yatzy_scores_50
    expected = 50
    actual = Yatzy.yatzy([4,4,4,4,4])
    assert expected == actual
    assert 50 == Yatzy.yatzy([6,6,6,6,6])
    assert 0 == Yatzy.yatzy([6,6,6,6,3])
  end

  def test_1s
    assert Yatzy.count_number(Dice.new(1,2,3,4,5).return_dice() ,1) == 1
    assert 2 == Yatzy.count_number(Dice.new(1,2,1,4,5).return_dice(), 1)
    assert 0 == Yatzy.count_number(Dice.new(6,2,2,4,5).return_dice(), 1)
    assert 4 == Yatzy.count_number(Dice.new(1,2,1,1,1).return_dice(), 1)
  end

  def test_2s
    assert Yatzy.count_number(Dice.new(1,2,3,2,6).return_dice(), 2) == 4
    assert Yatzy.count_number(Dice.new(2,2,2,2,2).return_dice(), 2) == 10
  end

  def test_threes
    assert 6 == Yatzy.count_number(Dice.new(1,2,3,2,3).return_dice(), 3)
    assert 12 == Yatzy.count_number(Dice.new(2,3,3,3,3).return_dice(), 3)
  end

  def test_fours_test
    assert 12 == Yatzy.count_number(Dice.new(4,4,4,5,5).return_dice(), 4)
    assert 8 == Yatzy.count_number(Dice.new(4,4,5,5,5).return_dice(), 4)
    assert 4 == Yatzy.count_number(Dice.new(4,5,5,5,5).return_dice(), 4)
  end

  def test_fives()
    assert 10 == Yatzy.count_number(Dice.new(4,4,4,5,5).return_dice(), 5)
    assert 15 == Yatzy.count_number(Dice.new(4,4,5,5,5).return_dice(), 5)
    assert 20 == Yatzy.count_number(Dice.new(4,5,5,5,5).return_dice(), 5)
  end

  def test_sixes_test
    assert 0 == Yatzy.count_number(Dice.new(4,4,4,5,5).return_dice(), 6)
    assert 6 == Yatzy.count_number(Dice.new(4,4,6,5,5).return_dice(), 6)
    assert 18 == Yatzy.count_number(Dice.new(6,5,6,6,5).return_dice(), 6)
  end

  def test_one_pair
    assert 6 == Yatzy.score_pair(Dice.new(3,4,3,5,6).return_dice())
    assert 10 == Yatzy.score_pair(Dice.new(5,3,3,3,5).return_dice())
    assert 8 == Yatzy.score_pair(Dice.new(4,3,6,6,4).return_dice())
  end

  def test_two_Pair
    assert_equal 16, Yatzy.two_pair(Dice.new(3,3,5,4,5).return_dice())
    assert_equal 16, Yatzy.two_pair(Dice.new(3,3,5,5,5).return_dice())
  end

  def test_three_of_a_kind()
    assert 9 == Yatzy.number_of_a_kind(Dice.new(3,3,3,4,5).return_dice(), 3)
    assert 15 == Yatzy.number_of_a_kind(Dice.new(5,3,5,4,5).return_dice(), 3)
    assert 9 == Yatzy.number_of_a_kind(Dice.new(3,3,3,3,5).return_dice(), 3)
    assert 9 == Yatzy.number_of_a_kind(Dice.new(3,3,3,3,3).return_dice(), 3)
  end

  def test_four_of_a_knd
    assert 12 == Yatzy.number_of_a_kind(Dice.new(3,3,3,3,5).return_dice(), 4)
    assert 20 == Yatzy.number_of_a_kind(Dice.new(5,5,5,4,5).return_dice(), 4)
    assert 12 == Yatzy.number_of_a_kind(Dice.new(3,3,3,3,3).return_dice(), 4)
  end

  def test_smallStraight()
    assert 15 == Yatzy.smallStraight(Dice.new(1,2,3,4,5).return_dice())
    assert 15 == Yatzy.smallStraight(Dice.new(2,3,4,5,1).return_dice())
    assert 0 == Yatzy.smallStraight(Dice.new(1,2,2,4,5).return_dice())
  end

  def test_largeStraight
    assert 20 == Yatzy.largeStraight(Dice.new(6,2,3,4,5).return_dice())
    assert 20 == Yatzy.largeStraight(Dice.new(2,3,4,5,6).return_dice())
    assert 0 == Yatzy.largeStraight(Dice.new(1,2,2,4,5).return_dice())
  end

  def test_fullHouse()
    puts Yatzy.fullHouse(Dice.new(2,3,4,5,6).return_dice())
    assert 18 == Yatzy.fullHouse(Dice.new(6,2,2,2,6).return_dice())
    assert 0 == Yatzy.fullHouse(Dice.new(2,3,4,5,6).return_dice())
  end
end
