require 'minitest/autorun'
require_relative '../lib/effector'

class EffectorTest < Minitest::Test
  def test_revers
    effect = Effector.revers
    assert_equal 'olleH !dlroW', effect.call('Hello World!')
  end

  def test_echoo
    effect = Effector.echoo(2)
    assert_equal 'HHeelllloo WWoorrlldd!!', effect.call('Hello World!')

    effect = Effector.echoo(3)
    assert_equal 'HHHeeellllllooo WWWooorrrlllddd!!!', effect.call('Hello World!')
  end

  def test_uppercase
    effect = Effector.uppercase(2)
    assert_equal 'HELLO!! WORLD!!!', effect.call('Hello World!')

    effect = Effector.uppercase(3)
    assert_equal 'HELLO!!! WORLD!!!!', effect.call('Hello World!')
  end
end
