require 'byebug'
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
    return :royal_flush if royal? && flush?
    return :straight_flush if straight? && flush?
    return :four_of_a_kind if four_of_a_kind?
    return :full_house if full_house?
    return :flush if flush?
    return :straight if straight?
    return :three_of_a_kind if three_of_a_kind?
    return :two_pair if two_pair?
    return :one_pair if one_pair?
    :high_card
  end

  def <=>(other)
    case RANKS.index(other.rank) <=> RANKS.index(rank)
    when -1
      -1
    when 0
      tie_breaker(other)
    when 1
      1
    end
  end

  protected

  def tie_breaker(other)
    case rank
    when :four_of_a_kind
      match_tie_breaker(other)
    when :two_pair
      match_tie_breaker(other)
    when :one_pair
      match_tie_breaker(other)
    else
      @cards.max <=> other.cards.max
    end
  end

  def match_tie_breaker(other)
    case cards_matching_val.max <=> other.cards_matching_val.max
    when -1
      -1
    when 0
      cards_non_matching_val.max <=> other.cards_non_matching_val.max
    when 1
      1
    end
  end

  def cards_matching_val
    @cards.select { |card| value_ranks.count(card.value_rank) > 1 }
  end

  def cards_non_matching_val
    @cards.reject { |card| value_ranks.count(card.value_rank) > 1 }
  end

  def suits
    @cards.map(&:suit)
  end

  def value_ranks
    @cards.map(&:value_rank).sort
  end

  def flush?
    suits.uniq.length == 1
  end

  def straight?
    return true if ace_low_straight?
    lowest = value_ranks.min
    sequence = (lowest..(lowest + 4)).to_a
    value_ranks == sequence
  end

  def ace_low_straight?
    value_ranks == [2, 3, 4, 5, 14]
  end

  def royal?
    value_ranks.all? { |v| v >= 10 }
  end

  def count_vals
    vals = Hash.new { |h, k| h[k] = 0 }
    value_ranks.each { |rank| vals[rank] += 1 }
    vals
  end

  def four_of_a_kind?
    count_vals.values.sort == [1, 4]
  end

  def full_house?
    count_vals.values.sort == [2, 3]
  end

  def three_of_a_kind?
    count_vals.values.sort == [1, 1, 3]
  end

  def two_pair?
    count_vals.values.sort == [1, 2, 2]
  end

  def one_pair?
    count_vals.values.sort == [1, 1, 1, 2]
  end
end
