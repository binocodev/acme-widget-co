require_relative 'product'
require_relative 'offer'
require_relative 'delivery_calculator'
require_relative 'offer_calculator'

class Basket
  attr_reader :catalog, :offers, :order

  CATALOG = {
    'R01' => Product.new('R01', 32.95, 'Red Widget'),
    'G01' => Product.new('G01', 24.95, 'Green Widget'),
    'B01' => Product.new('B01', 7.95, 'Blue Widget')
  }.freeze

  OFFERS = {
    red_widget_bogo: Offer.new('R01', 2, 0.5)
  }.freeze

  def initialize(catalog = CATALOG, offers = OFFERS)
    @catalog = catalog
    @offers = offers
    @order = []
    @offer_calculator = OfferCalculator.new(@catalog, @offers)
  end

  def add(product_code)
    product = @catalog[product_code]
    @order << product if product
  end

  def total
    subtotal_after_discounts = subtotal - discount
    delivery = DeliveryCalculator.calculate(subtotal_after_discounts)
    (subtotal_after_discounts + delivery).round(2)
  end

  private

  def subtotal
    @order.sum(&:price)
  end

  def discount
    @offer_calculator.calculate_discount(@order)
  end
end