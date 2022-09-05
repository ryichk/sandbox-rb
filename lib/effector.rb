module Effector
  class << self
    def reverse
      ->(words) {
        words.split(' ').map(&:reverse).join(' ')
      }
    end

    def echo(rate)
      ->(words) {
        words.each_char.map do |w|
          w == ' ' ? w : w * rate
        end.join
      }
    end

    def upper(level)
      ->(words) {
        words.split(' ').map do |word|
          "#{word.upcase}#{'!' * level}"
        end.join(' ')
      }
    end
  end
end
