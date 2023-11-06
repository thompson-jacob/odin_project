class StockPicker

  def stock_picker(stock_prices) 
    max_profit = 0
    low_index = 0
    best_pair = [0,0]

    stock_prices.each_with_index do |price, i|

      temp_profit = stock_prices[i] - stock_prices[low_index]
      if temp_profit > max_profit 
        max_profit = temp_profit
        best_pair = [low_index, i]
      end

      low_index = i  if price < stock_prices[low_index]
        
      

    end
     best_pair
  end

end


days = [17,3,6,9,15,8,6,1,10]
test = StockPicker.new

pp test.stock_picker(days)
