class Hand

  HEIRARCHY = [ :straight_flush,
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
    @cards = cards
  end

  def top_combo
  end

  private

end
