require 'spec_helper'
require_relative '../lib/basket'

describe Basket do
  describe '#total' do
    it 'returns 37.85 for B01, G01' do
      basket = Basket.new
      basket.add('B01')
      basket.add('G01')
      expect(basket.total).to eq(37.85)
    end

    it 'returns 54.37 for R01, R01' do
      basket = Basket.new
      basket.add('R01')
      basket.add('R01')
      expect(basket.total).to eq(54.37)
    end

    it 'returns 60.85 for R01, G01' do
      basket = Basket.new
      basket.add('R01')
      basket.add('G01')
      expect(basket.total).to eq(60.85)
    end

    it 'returns 98.27 for B01, B01, R01, R01, R01' do
      basket = Basket.new
      basket.add('B01')
      basket.add('B01')
      basket.add('R01')
      basket.add('R01')
      basket.add('R01')
      expect(basket.total).to eq(98.27)
    end
  end
end
