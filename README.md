# Acme Widget Co - Basket Calculator

This is a simple Ruby command-line tool that calculates the total cost of a shopping basket for Acme Widget Co, including delivery fees and special offers.

## How it Works

- The basket is initialized with a product catalog, delivery charge rules, and available offers.
- Add products to the basket by entering their codes (e.g., `R01`, `G01`, `B01`).
- The program calculates the subtotal, applies any relevant offers, adds delivery charges, and outputs the final total.

## Running the Program

1. Make sure you have Ruby installed.
2. Run the CLI tool:
   ```sh
   ruby cli.rb
   ```
3. Enter product codes separated by commas when prompted.

## Assumptions
- All products with the same code have the same price.
- Delivery charges are based on the basket total after discounts:
    - Under $50: $4.95
    - $50–$89.99: $2.95
    - $90 or more: Free delivery
- Offers are applied per product and can be combined. Currently, only one offer is implemented ("Buy 1 Red Widget, get the second half price").  
  If more offers are added, the system is designed to support combining multiple offers per product.


