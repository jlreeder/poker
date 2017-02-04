class Card
  SUITS = %i(spades clubs hearts diamonds)

  attr_reader :suit, :value

  def initialize(suit, value)
    raise 'invalid suit' unless SUITS.contain?(suit)
    @suit = suit
    @value = value
  end
end
