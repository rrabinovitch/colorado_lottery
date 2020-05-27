require 'minitest/autorun'
require 'minitest/pride'
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
end
