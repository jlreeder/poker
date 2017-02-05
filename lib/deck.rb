require 'card'

class Deck

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def take(num)
    raise 'not enough cards' unless count - num >= 0
    @cards.shift(num)
  end

  def return(returned_cards)
    @cards.concat(returned_cards)
  end

  def shuffle
    
  end

  def self.all_cards
    deck = []

    Card::SUITS_SYMS.each do |suit|
      Card::VALUES_SYMS.each do |value|
        deck << Card.new(suit, value)
      end
    end

    deck
  end
end
