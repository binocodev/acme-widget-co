require 'spec_helper'
require_relative '../basket'

describe Basket do
  describe '#total' do
    it 'returns 37.85 for B01, G01' do
      basket = Basket.new
      basket.add_products(['B01', 'G01'])
      expect(basket.total).to eq(37.85)
    end

    it 'returns 54.38 for R01, R01' do
      basket = Basket.new
      basket.add_products(['R01', 'R01'])
      expect(basket.total).to eq(54.38)
    end

    it 'returns 60.85 for R01, G01' do
      basket = Basket.new
      basket.add_products(['R01', 'G01'])
      expect(basket.total).to eq(60.85)
    end

    it 'returns 98.28 for B01, B01, R01, R01, R01' do
      basket = Basket.new
      basket.add_products(['B01', 'B01', 'R01', 'R01', 'R01'])
      expect(basket.total).to eq(98.28)
    end
  end
end
