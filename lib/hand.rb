class Hand
  RANKS = [
    :royal_flush,
    :straight_flush,
    :four_of_a_kind,
    :full_house,
    :flush,
    :straight,
    :three_of_a_kind,
    :two_pair,
    :one_pair,
    :high_card
  ]

  attr_reader :cards

  def initialize(cards)
    raise 'must have five cards' unless cards.length == 5
    @cards = cards
  end

  def trade_cards(discard_cs, receive_cs)
    raise 'must have five cards' unless discard_cs.length == receive_cs.length
    raise 'cannot discard unowned card' unless discard_cs.all? do |c|
      @cards.include?(c)
    end

    discard_cs.each { |card| @cards.delete(card) }
    @cards.concat(receive_cs)
  end

  def rank
    :royal_flush
  end

  protected

  def <=>(other)
    RANKS.index(rank) <=> RANKS.index(other.rank)
  end

end
