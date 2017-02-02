require 'card'

class Deck
  attr_reader :cards

  SUITS = %i(d s c h)
  VALUES = %i(2 3 4 5 6 7 8 9 10 j q k a)

  def initialize
    @cards = []
    populate
  end

  def shuffle; end

  def deal; end

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
