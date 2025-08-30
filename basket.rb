require_relative 'product'
require_relative 'offer'
require_relative 'delivery_calculator'
require_relative 'offer_calculator'

class Basket
  attr_reader :catalog, :delivery_cost_rules, :offers, :order

  def initialize(offers = OFFERS, catalog = CATALOG, delivery_cost_rules = DELIVERY_COST_RULES )
    @catalog = catalog
    @delivery_cost_rules = delivery_cost_rules
    @offers = offers
    @order = []
    @offer_calculator = OfferCalculator.new(@catalog, @offers)
  end

  CATALOG = {
    'R01' => Product.new('R01', 32.95, 'Red Widget'),
    'G01' => Product.new('G01', 24.95, 'Green Widget'),
    'B01' => Product.new('B01', 7.95, 'Blue Widget')
  }.freeze

  DELIVERY_COST_RULES = {
    standard: 4.95,
    discount: 2.95,
    free: 0
  }.freeze

  OFFERS = {
    red_widget_bogo: Offer.new('R01', 2, 0.5)
  }.freeze

  def add(product_code)
    add_product(product_code)
  end

  def add_product(product_code)
    product = @catalog[product_code]
    if product
      @order << product
      @offers_discount = nil
    end
  end

  def add_products(product_codes)
    product_codes.each { |code| add_product(code) }
  end

  def delivery_fee
    subtotal_with_discounts = subtotal - offers_discount
    DeliveryCalculator.calculate(subtotal_with_discounts)
  end

  def subtotal
    @order.sum(&:price)
  end

  def offers_discount
    @offer_calculator.calculate_discount(@order)
  end

  def total
    (subtotal + delivery_fee - offers_discount).round(2)
  end
end