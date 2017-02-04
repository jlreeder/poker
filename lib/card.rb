class Card
  SUITS = %i(spades clubs hearts diamonds)
  VALUES = %i(two three four five six seven eight nine ten jack queen king ace)

  attr_reader :suit, :value

  def initialize(suit, value)
    raise 'invalid suit' unless SUITS.include?(suit)
    raise 'invalid value' unless VALUES.include?(value)
    @suit = suit
    @value = value
  end

  def <=>(other)
    value_match = value == other.value
    suit_match = suit == other.suit

    return 0 if value_match && suit_match
  end
end
