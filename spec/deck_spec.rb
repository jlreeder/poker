require 'deck'

describe 'Deck' do
  describe '#initialize' do
    it 'has an array of cards'

    it 'has 52 cards'

    it 'has cards that are all unique'
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
