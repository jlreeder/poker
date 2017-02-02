require 'deck'

describe 'Deck' do
  describe '#initialize' do
    subject { Deck.new.cards }

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
      #NOTE: This is calling a method in Card. Should I refactor?
      val_suits = subject.map { |card| card.show }
      expect(val_suits.uniq.length).to eq(52)
    end
  end

  describe '#shuffle' do
    it 'mixes up the card order'
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
