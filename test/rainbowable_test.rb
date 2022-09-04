require 'minitest/autorun'
require_relative '../lib/rainbowable'

class RainbowableTest < Minitest::Test
  def setup
    String.include Rainbowable
    Array.include Rainbowable
  end

  def test_rainbow
    expected = "\e[31mH\e[32mi\e[33m!\e[34m \e[35mn\e[36mi\e[31mc\e[32me\e[33m \e[34mt\e[35mo\e[36m \e[31mm\e[32me\e[33me\e[34mt\e[35m \e[36my\e[31mo\e[32mu\e[0m"
    assert_equal expected, 'Hi! nice to meet you'.rainbow

    expected = "\e[31m[\e[32m1\e[33m,\e[34m \e[35m2\e[36m,\e[31m \e[32m3\e[33m,\e[34m \e[35m4\e[36m,\e[31m \e[32m5\e[33m]\e[0m"
    assert_equal expected, [1, 2, 3, 4, 5].rainbow
  end
end
