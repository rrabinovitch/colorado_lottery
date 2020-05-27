require 'minitest/autorun'
require 'minitest/pride'
require './lib/colorado_lottery'

class ColoradoLotteryTest < Minitest::Test
  def setup
    @lottery = ColoradoLottery.new
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
