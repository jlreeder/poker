class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def show
    "#{value}#{suit[0]}"
  end
end
