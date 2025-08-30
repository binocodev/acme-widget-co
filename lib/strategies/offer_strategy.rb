class OfferStrategy
  def calculate_discount(offer, order)
    raise NotImplementedError
  end
end