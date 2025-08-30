require_relative 'lib/basket'

def main
  puts "Acme Widget Co - Basket Calculator"
  puts "==================================="
  puts "Available products:"
  puts "R01 - Red Widget ($32.95)"
  puts "G01 - Green Widget ($24.95)"
  puts "B01 - Blue Widget ($7.95)"
  puts ""
  puts "Enter product codes separated by commas (e.g., B01,B01,R01,R01,R01):"
  
  input = gets.chomp
  product_codes = input.split(',').map(&:strip).map(&:upcase)
  
  basket = Basket.new
  product_codes.each do |code|
    basket.add(code)
  end
  puts "\nBasket Contents:"
  basket.order.each { |product| puts "- #{product.name} (#{product.code}): $#{product.price}" }

  puts "Total: $#{ basket.total}"
end

main if __FILE__ == $0