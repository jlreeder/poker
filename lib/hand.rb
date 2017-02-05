class Hand
  attr_reader :cards

  def initialize(cards)
    raise 'must have five cards' unless cards.length == 5
    @cards = cards
  end
end
