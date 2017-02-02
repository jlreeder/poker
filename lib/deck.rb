require 'card'

class Deck
  attr_reader :cards

  SUITS = %i(d s c h)
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  FACE_VALs = { j: 11, q: 12, k: 13, a: 14 }

  def initialize
    @cards = []
    populate
    @cards.shuffle!
  end

  def deal(quantity = 5)
    raise 'Out of cards' if quantity > cards.length
    cards.pop(quantity)
  end

  def show_card(card)
    raise "Card not in deck: #{card}" unless cards.include?(card)
    card.show
  end

  private

  def populate
    VALUES.each do |value|
      SUITS.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
  end
end
