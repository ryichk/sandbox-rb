require 'minitest/autorun'
require_relative '../lib/word_processor'
require_relative '../lib/effector'

class WordProcessorTest < Minitest::Test
  def test_exec_without_effects
    processor = WordProcessor.new
    assert_equal 'Hello World!', processor.exec('Hello World!')
  end

  def test_exec_with_reverse
    processor = WordProcessor.new
    processor.add_effect(Effector.reverse)
    assert_equal 'olleH !dlroW', processor.exec('Hello World!')
  end

  def test_exec_with_all_effects
    processor = WordProcessor.new
    processor.add_effect(Effector.echo(4))
    processor.add_effect(Effector.upper(5))
    processor.add_effect(Effector.reverse)
    assert_equal '!!!!!OOOOLLLLLLLLEEEEHHHH !!!!!!!!!DDDDLLLLRRRROOOOWWWW',
      processor.exec('Hello World!')
  end
end
