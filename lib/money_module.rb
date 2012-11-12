module MoneyModule
# A group of methods for dealing with money. If you need something more robust, try the Money gem.

  def sanitize_money # Cleans out dollar signs, commas, etc. Returns a BigDecimal.
    decimal = self.gsub(/[^\d\.]/, '')
    decimal = BigDecimal.new(decimal).round(2)
  end

# These two methods take a BigDecimal and return either an integer or float

  def to_cents # Returns an integer (number of cents): Takes user input
    unless self.class == BigDecimal # Ensure method only runs on a BigDecimal with 2 decimals
      decimal = self.sanitize_money
    else
      decimal = self.round(2)
    end
    cents = (decimal * 100).to_i
  end

  def to_dollars # Returns a decimal string (Dollars and cents): Returns human-friendly value
    integer = BigDecimal.new(self) unless self.class == BigDecimal # Expects an integer
    dollars = (integer / 100).to_s
    if dollars == "0.0" # Return False if input value was incorrect. Did you sanitize first?
      return false
    else
      dollars
    end
  end

  def dollars_to_pesos # Returns an integer representation of price in pesos: Human-friendly value
    dollars = self.to_dollars
    pesos = (dollars * EXCHANGE_RATE).to_i
  end

  def calculate_cost # Used to return amount total in cents for payment
    pesos = BigDecimal.new(self.size) * COURSE_COST
    cents = (pesos.div(EXCHANGE_RATE, 10).round(2) * 100).to_i
  end

end