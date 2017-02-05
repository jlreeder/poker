require 'card'

class Deck
  attr_reader :cards

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.count
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
