require 'card'

class Deck
  attr_reader :all_cards

  def initialize(cards = Deck.default_deck)
    @all_cards = cards
  end

  def count
    @all_cards.count
  end

  def self.default_deck
    deck = []

    Card::SUITS_SYMS.each do |suit|
      Card::VALUES_SYMS.each do |value|
        deck << Card.new(suit, value)
      end
    end

    deck
  end
end
