require 'hand'

describe 'Hand' do
  let(:val_suits) { %w(1h 2h 4d 5d 10c) }
  let(:cards) do
    val_suits.map { |vs| double('vs') }
  end
  let(:hand) { Hand.new(cards) }

  describe '#initialize' do
    it 'contains 5 cards' do
      expect(hand.cards.length).to eq(5)
    end
  end

  describe '#top_combo' do
    context 'when there is no combo' do
      it 'returns the highest single card'
    end

    context 'when there is one combo' do
      it 'recognizes that combo'
    end

    context 'when there are multiple combos' do
      it 'finds the best possible'
    end
  end
end
