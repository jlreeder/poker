class Card
  SUITS_SYMS = %i(clubs diamonds hearts spades)
  SUITS_RANKS = (0..4)
  SUITS = Hash[SUITS_SYMS.zip(SUITS_RANKS)]

  VALUES_SYMS = %i(two three four five six seven eight nine ten jack queen king
                   ace)
  VALUES_RANKS = (2..14)
  VALUES = Hash[VALUES_SYMS.zip(VALUES_RANKS)]


  attr_reader :suit, :value

  def initialize(suit, value)
    raise 'invalid suit' unless SUITS.key?(suit)
    raise 'invalid value' unless VALUES.key?(value)
    @suit = suit
    @value = value
  end

  def <=>(other)
    value_match = value_rank <=> other.value_rank
    suit_match = suit_rank <=> other.suit_rank

    return 0 if value_match.zero? && suit_match.zero?
  end

  protected

  def suit_rank
    SUITS[@suit]
  end

  def value_rank
    VALUES[@value]
  end
end
