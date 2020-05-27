require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'
require './lib/game'
require './lib/colorado_lottery'

class ColoradoLotteryTest < Minitest::Test
  def setup
    @lottery = ColoradoLottery.new

    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)

    @alexander = Contestant.new({
                      first_name: 'Alexander',
                      last_name: 'Aigades',
                      age: 28,
                      state_of_residence: 'CO',
                      spending_money: 10})
    @benjamin = Contestant.new({
                      first_name: 'Benjamin',
                      last_name: 'Franklin',
                      age: 17,
                      state_of_residence: 'PA',
                      spending_money: 100})
    @frederick = Contestant.new({
                      first_name: 'Frederick',
                      last_name: 'Douglas',
                      age: 55,
                      state_of_residence: 'NY',
                      spending_money: 20})
    @winston = Contestant.new({
                      first_name: 'Winston',
                      last_name: 'Churchill',
                      age: 18,
                      state_of_residence: 'CO',
                      spending_money: 5})
  end

  def test_it_exists
    assert_instance_of ColoradoLottery, @lottery
  end

  def test_it_starts_with_no_registered_contestants_winners_and_current_contestants
    assert_empty @lottery.registered_contestants
    assert_empty @lottery.winners
    assert_empty @lottery.current_contestants
  end

  def test_it_can_identify_whether_contestant_is_interested_and_18
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @frederick.add_game_interest('Mega Millions')
    @winston.add_game_interest('Cash 5')
    @winston.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')
    assert_equal true, @lottery.interested_and_18?(@alexander, @pick_4)
    assert_equal false, @lottery.interested_and_18?(@benjamin, @mega_millions)
    assert_equal false, @lottery.interested_and_18?(@alexander, @cash_5)
  end

  def test_it_can_determine_if_contestant_can_register
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @frederick.add_game_interest('Mega Millions')
    @winston.add_game_interest('Cash 5')
    @winston.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')
    assert_equal true, @lottery.can_register?(@alexander, @pick_4)
    assert_equal false, @lottery.can_register?(@alexander, @cash_5)
    assert_equal true, @lottery.can_register?(@frederick, @mega_millions)
    assert_equal false, @lottery.can_register?(@benjamin, @mega_millions)
    assert_equal false, @lottery.can_register?(@frederick, @cash_5)

    # interested_and_18? && (Colorado resident || national game?)
  end
end
