require 'byebug'
require 'deck'

describe 'Deck' do
  let(:deck) { Deck.new }

  describe '#initialize' do
    subject { deck.cards }

    it 'has an array of cards' do
      expect(subject).to be_an(Array)
    end

    it 'has 52 cards' do
      expect(subject.length).to eq(52)
    end

    it 'has cards that are all unique objects' do
      expect(subject.uniq.length).to eq(52)
    end

    it 'has cards that all have unique value-suit pairs' do
      val_suits = subject.map { |card| deck.show_card(card) }
      expect(val_suits.uniq.length).to eq(52)
    end

    it 'shuffles the cards' do
      deck2 = Deck.new
      cards2 = deck2.cards
      val_suits1 = subject.map { |card| deck.show_card(card) }
      val_suits2 = cards2.map { |card| deck2.show_card(card) }

      expect(val_suits1).to_not eq(val_suits2)
    end
  end

  describe '#deal' do
    context 'when the request is fulfillable' do
      it 'returns a certain number of cards'

      it 'removes those cards from its collection'
    end

    context 'when the request is not fulfillable' do
      it 'returns an error if deck would run out'
    end
  end
end
