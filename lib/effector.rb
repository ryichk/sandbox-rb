module Effector
  class << self
    def revers
      ->(words) {
        words.split(' ').map(&:reverse).join(' ')
      }
    end

    def echoo(rate)
      ->(words) {
        words.each_char.map do |w|
          w == ' ' ? w : w * rate
        end.join
      }
    end

    def uppercase(level)
      ->(words) {
        words.split(' ').map do |word|
          "#{word.upcase}#{'!' * level}"
        end.join(' ')
      }
    end
  end
end
