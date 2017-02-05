class Player
  attr_reader :bankroll

  def initialize(bankroll)
    @bankroll = bankroll
  end

  def self.buy_in(bankroll)
    Player.new(bankroll)
  end
end
