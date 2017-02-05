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
    :straight_flush if straight? && flush?
  end

  def <=>(other)
    case RANKS.index(rank) <=> RANKS.index(other.rank)
    when 0
      @cards.max <=> other.cards.max
    end
  end

  protected

  def suits
    @cards.map(&:suit)
  end

  def flush?
    suits.length == 1
  end

  def straight?
    val_ranks = @cards.map { |c| c.value_rank }
    lowest = val_ranks.min
    sequence = (lowest..(lowest + 5))
    val_ranks == sequence
  end

end
