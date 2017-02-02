require 'hand'

describe 'Hand' do
  describe '#initialize' do
    it 'contains 5 cards'
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
