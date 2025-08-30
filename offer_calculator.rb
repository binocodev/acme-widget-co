class OfferCalculator
  def initialize(catalog, offers)
    @catalog = catalog
    @offers = offers
  end

  def calculate_discount(order)
    @offers.values.sum { |offer| apply_offer(offer, order) }
  end

  private

  def apply_offer(offer, order)
    count = order.count { |product| product.code == offer.product_code }
    return 0 if count < offer.quantity
    
    @catalog[offer.product_code].price * offer.discount_value
  end
end