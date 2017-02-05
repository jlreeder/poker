require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :pot, :deck, :players

  def initialize
    @pot = 0
    @deck = Deck.new
    @players = []
  end

  def add_players(num, buy_in)
    num.times { players << Player.new(buy_in) }
  end

  def game_over?
    @players.select { |p| p.bankroll > 0 }.length == 1
  end
end
