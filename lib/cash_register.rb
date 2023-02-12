# class CashRegister
#     attr_accessor :total, :discount, :last_transaction
  
#     def initialize(discount = 0)
#       @total = 0
#       @discount = discount
#     end
  
#     def add_item(price)
#       self.total += price
#       self.last_transaction = price
#     end
  
#     def apply_discount
#       self.total = (total * (100.0 - discount) / 100.0).to_i
#       "After the discount, the total comes to $#{total}."
#     end
  
#     def void_last_transaction
#       self.total -= last_transaction
#     end
#   end
  

class CashRegister
    attr_accessor :total, :receipt, :items
    attr_reader :discount

    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @receipt = []
    end
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @receipt.push({ title: title, price: price, quantity: quantity }) }
    end
    def apply_discount
      if @discount > 0
        savings = @total * @discount / 100
        @total -= savings
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
    def items
      @receipt.map { |item| item[:title] }
    end
    def void_last_transaction
      las_transaction = receipt.pop
      @total -= las_transaction[:price] * las_transaction[:quantity]
    end
end