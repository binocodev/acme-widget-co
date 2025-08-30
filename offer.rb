class Offer
  attr_reader :product_code, :min_quantity, :discount_rate, :strategy

  def initialize(product_code, min_quantity, discount_rate, strategy)
    @product_code = product_code
    @min_quantity = min_quantity
    @discount_rate = discount_rate
    @strategy = strategy
  end

  def calculate_discount(order)
    @strategy.calculate_discount(self, order)
  end
end