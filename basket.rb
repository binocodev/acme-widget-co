require_relative 'product'
require_relative 'offer_strategy'
require_relative 'bogo_strategy'
require_relative 'offer'
require_relative 'offer_calculator'
require_relative 'delivery_calculator'

class Basket
  attr_reader :order

  CATALOG = {
    'R01' => Product.new('R01', 32.95, 'Red Widget'),
    'G01' => Product.new('G01', 24.95, 'Green Widget'),
    'B01' => Product.new('B01', 7.95, 'Blue Widget')
  }.freeze

  def initialize(catalog = CATALOG, offers = default_offers)
    @catalog = catalog
    @offers = offers
    @order = []
  end

  def add(product_code)
    product = @catalog[product_code]
    @order << product if product
  end

  def total
    (subtotal_after_discounts + delivery_fee).round(2)
  end

  private

  def default_offers
    @default_offers ||= [Offer.new('R01', 2, 0.5, BogoStrategy.new)]
  end

  def subtotal
    @order.sum(&:price)
  end

  def subtotal_after_discounts
    subtotal - discount
  end

  def delivery_fee
    DeliveryCalculator.calculate(subtotal_after_discounts)
  end

  def discount
    offer_calculator.calculate_discount(@order)
  end

  def offer_calculator
    @offer_calculator ||= OfferCalculator.new(@offers)
  end
end