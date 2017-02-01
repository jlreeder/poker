require 'card'

describe 'Card' do
  describe '#initialize' do
    subject { Card.new(:'2', :clubs) }

    it 'has a value' do
      expect(subject.value).to eq(:'2')
    end

    it 'has a suit' do
      expect(subject.suit).to eq(:clubs)
    end
  end

  describe '#show' do
    it 'returns a string of the value and suit combined' do
      card = Card.new(:'2', :clubs)
      expect(card.show).to eq('2c')
    end
  end

  describe '#match_value?' do
    it 'recognizes when it matches another card\'s value'

    it 'recognizes when it does not match another card\'s value'
  end

  describe '#match_suit?' do
    it 'recognizes when it matches another card\'s suit'

    it 'recognizes when it does not match another card\'s suit'
  end

  describe '#one_above?' do
    it 'recognizes when it is one above another card'

    it 'recognizes when it is not one above another card'
  end
end
