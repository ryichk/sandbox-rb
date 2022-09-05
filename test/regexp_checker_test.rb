require 'minitest/autorun'
require_relative '../lib/regexp_checker'

class RegexpCheckerTest < Minitest::Test
  def test_matched
    inputs = [
      "123-456-789\n",
      "[1-9+\n",
      "[1-9]+\n"
    ]
    expected = [
      'Text?:',
      'Pattern?:',
      "Invalid pattern: premature end of char-class: /[1-9+/\n",
      'Pattern?:',
      "Matched: 123,456,789\n"
    ].join

    stub :gets, -> { inputs.shift } do
      assert_output(expected) do
        regexp_checker
      end
    end
  end

  def test_unmatch
    inputs = [
      "abcdefg\n",
      "[1-9]+\n"
    ]
    expected = [
      'Text?:',
      'Pattern?:',
      "Nothing matched.\n"
    ].join

    stub :gets, -> { inputs.shift } do
      assert_output(expected) do
        regexp_checker
      end
    end
  end
end
