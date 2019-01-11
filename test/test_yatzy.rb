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
    assert Yatzy.ones(Dice.new(1,2,3,4,5).return_dice()) == 1
    assert 2 == Yatzy.ones(Dice.new(1,2,1,4,5).return_dice())
    assert 0 == Yatzy.ones(Dice.new(6,2,2,4,5).return_dice())
    assert 4 == Yatzy.ones(Dice.new(1,2,1,1,1).return_dice())
  end

  def test_2s
    assert Yatzy.twos(Dice.new(1,2,3,2,6).return_dice()) == 4
    assert Yatzy.twos(Dice.new(2,2,2,2,2).return_dice()) == 10
  end

  def test_threes
    assert 6 == Yatzy.threes(Dice.new(1,2,3,2,3).return_dice())
    assert 12 == Yatzy.threes(Dice.new(2,3,3,3,3).return_dice())
  end

  def test_fours_test
    assert 12 == Yatzy.fours(Dice.new(4,4,4,5,5).return_dice())
    assert 8 == Yatzy.fours(Dice.new(4,4,5,5,5).return_dice())
    assert 4 == Yatzy.fours(Dice.new(4,5,5,5,5).return_dice())
  end

  def test_fives()
    assert 10 == Yatzy.fives(Dice.new(4,4,4,5,5).return_dice())
    assert 15 == Yatzy.fives(Dice.new(4,4,5,5,5).return_dice())
    assert 20 == Yatzy.fives(Dice.new(4,5,5,5,5).return_dice())
  end

  def test_sixes_test
    assert 0 == Yatzy.sixes(Dice.new(4,4,4,5,5).return_dice())
    assert 6 == Yatzy.sixes(Dice.new(4,4,6,5,5).return_dice())
    assert 18 == Yatzy.sixes(Dice.new(6,5,6,6,5).return_dice())
  end

  def test_one_pair
    assert 6 == Yatzy.score_pair(3,4,3,5,6)
    assert 10 == Yatzy.score_pair(5,3,3,3,5)
    assert 12 == Yatzy.score_pair(5,3,6,6,5)
  end

  def test_two_Pair
    assert_equal 16, Yatzy.two_pair(3,3,5,4,5)
    assert_equal 16, Yatzy.two_pair(3,3,5,5,5)
  end

  def test_three_of_a_kind()
    assert 9 == Yatzy.three_of_a_kind(3,3,3,4,5)
    assert 15 == Yatzy.three_of_a_kind(5,3,5,4,5)
    assert 9 == Yatzy.three_of_a_kind(3,3,3,3,5)
  end

  def test_four_of_a_knd
    assert 12 == Yatzy.four_of_a_kind(3,3,3,3,5)
    assert 20 == Yatzy.four_of_a_kind(5,5,5,4,5)
    assert 9 == Yatzy.three_of_a_kind(3,3,3,3,3)
    assert 12 == Yatzy.four_of_a_kind(3,3,3,3,3)
  end

  def test_smallStraight()
    assert 15 == Yatzy.smallStraight(1,2,3,4,5)
    assert 15 == Yatzy.smallStraight(2,3,4,5,1)
    assert 0 == Yatzy.smallStraight(1,2,2,4,5)
  end

  def test_largeStraight
    assert 20 == Yatzy.largeStraight(6,2,3,4,5)
    assert 20 == Yatzy.largeStraight(2,3,4,5,6)
    assert 0 == Yatzy.largeStraight(1,2,2,4,5)
  end

  def test_fullHouse()
    assert 18 == Yatzy.fullHouse(6,2,2,2,6)
    assert 0 == Yatzy.fullHouse(2,3,4,5,6)
  end
end
