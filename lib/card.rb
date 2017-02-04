class Card
  SUITS = %i(spades clubs hearts diamonds)
  VALUES = %i(two three four five six seven eight nine ten jack queen king ace)

  attr_reader :suit, :value

  def initialize(suit, value)
    raise 'invalid suit' unless SUITS.contain?(suit)
    raise 'invalid value' unless VALUES.contain?(value)
    @suit = suit
    @value = value
  end
end
