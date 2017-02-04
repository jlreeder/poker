class Card
  SUITS_SYMS = %i(clubs diamonds hearts spades)
  SUITS_NUMS = (0..4)
  SUITS = Hash[Suits.zip(SUIT_VALS)]

  VALUES_SYMS = %i(two three four five six seven eight nine ten jack queen king
                   ace)
  VALUES_VALS = (2..14)
  VALUES = Hash[VALUES_SYMS.zip(VALUES_NUMS)]


  attr_reader :suit, :value

  def initialize(suit, value)
    raise 'invalid suit' unless SUITS.key?(suit)
    raise 'invalid value' unless VALUES.key?(value)
    @suit = suit
    @value = value
  end

  def <=>(other)
    value_match = value <=> other.value
    suit_match = suit <=> other.suit

    return 0 if value_match && suit_match
  end
end
