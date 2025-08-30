class DeliveryCalculator

  def self.calculate(subtotal_after_discounts, delivery_rules)
    case subtotal_after_discounts
    when 0...50
      delivery_rules[:under_50]
    when 50...90
      delivery_rules[:under_90]
    else
      delivery_rules[:over_90]
    end
  end
end