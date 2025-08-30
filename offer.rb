class Offer
  attr_reader :product_code, :quantity, :discount_value

  def initialize(product_code, quantity, discount_value)
    @product_code = product_code
    @quantity = quantity
    @discount_value = discount_value
  end
end