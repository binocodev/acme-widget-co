require_relative 'product'
require_relative 'offer'

class Basket
  attr_reader :catalog, :delivery_cost_rules, :offers, :order

  def initialize(offers = OFFERS, catalog = CATALOG, delivery_cost_rules = DELIVERY_COST_RULES )
    @catalog = catalog
    @delivery_cost_rules = delivery_cost_rules
    @offers = offers
    @order = []
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
    case subtotal_with_discounts
    when 0...50
      @delivery_cost_rules[:standard]
    when 50...90
      @delivery_cost_rules[:discount]
    else
      @delivery_cost_rules[:free]
    end
  end

  def subtotal
    @order.sum(&:price)
  end

  def offers_discount
    @offers_discount ||= calculate_offers_discount
  end

  def total
    (subtotal + delivery_fee - offers_discount).round(2)
  end

  private

  def calculate_offers_discount
    @offers.values.sum { |offer| apply_offer(offer) }
  end

  def apply_offer(offer)
    count = @order.count { |product| product.code == offer.product_code }
    return 0 if count < offer.quantity
    
    @catalog[offer.product_code].price * offer.discount_value
  end
end