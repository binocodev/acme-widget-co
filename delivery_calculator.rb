class DeliveryCalculator
  RULES = {
    standard: 4.95,
    discount: 2.95,
    free: 0
  }.freeze

  def self.calculate(subtotal_after_discounts)
    case subtotal_after_discounts
    when 0...50
      RULES[:standard]
    when 50...90
      RULES[:discount]
    else
      RULES[:free]
    end
  end
end