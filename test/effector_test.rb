require 'minitest/autorun'
require_relative '../lib/effector'

class EffectorTest < Minitest::Test
  def test_reverse
    effect = Effector.reverse
    assert_equal 'olleH !dlroW', effect.call('Hello World!')
  end

  def test_echo
    effect = Effector.echo(2)
    assert_equal 'HHeelllloo WWoorrlldd!!', effect.call('Hello World!')

    effect = Effector.echo(3)
    assert_equal 'HHHeeellllllooo WWWooorrrlllddd!!!', effect.call('Hello World!')
  end

  def test_upper
    effect = Effector.upper(2)
    assert_equal 'HELLO!! WORLD!!!', effect.call('Hello World!')

    effect = Effector.upper(3)
    assert_equal 'HELLO!!! WORLD!!!!', effect.call('Hello World!')
  end
end
