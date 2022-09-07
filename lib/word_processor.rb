class WordProcessor
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def exec(original_words)
    @effects.inject(original_words) do |words, effect|
      effect.call(words)
    end
  end
end
