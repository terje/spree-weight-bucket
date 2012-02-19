module Spree
  class Calculator::WeightBucket < Calculator
    preference :weight_table, :string
    preference :price_table, :string
    preference :default_weight, :float, :default => 0
    preference :min_price, :float, :default => 0
    preference :max_price, :float, :default => 50

    def self.description
      "Weight buckets for shipping"
    end

    def available?(order)
      return false if order.total < self.preferred_min_price
      return false if order.total >= self.preferred_max_price

      return true
    end

    def compute(order)
      prices = self.preferred_price_table.split
      weights = self.preferred_weight_table.split

      weight_prices = weights.to_enum(:each_with_index).map do |weight, i|
        {:weight => weight.to_f, :price => price.to_f}
      end

      total_weight = 0
      order.line_items.each do |item|
        total_weight += item.quantity * (item.variant.weight || self.preferred_default_weight)
      end

      shipping_price = 0
      weight_prices.each do |weight_price|
        shipping_price = weight_price[:price] if total_weight < weight_price[:weight]
      end

      return shipping_price
    end
  end
end
