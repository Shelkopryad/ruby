class Calculator

  def sum(a, b)
    a + b
  end

  def substract(a, b)
    a - b
  end

  def multyply(a, b)
    a * b
  end

  def divide(a, b)
    begin
      a / b
    rescue
      "Divide by zero"
    end
  end

end
