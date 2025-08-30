class BogoStrategy < OfferStrategy
  def calculate_discount(offer, order)
    matching_items = order.select { |product| product.code == offer.product_code }
    return 0 if matching_items.count < offer.min_quantity

    matching_items.first.price * offer.discount_rate
  end
end
