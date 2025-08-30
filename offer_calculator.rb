class OfferCalculator
  def initialize(offers)
    @offers = offers
  end

  def calculate_discount(order)
    @offers.sum { |offer| offer.calculate_discount(order) }.round(2)
  end
end