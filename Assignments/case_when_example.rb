# Create a method called "calculate" that takes two numbers and a symbol as arguments. Implement a case statement to perform different mathematical operations based on the symbol (+, -, *, /) and return the result.

def calculate(n1,n2,symbol)
  case symbol
    when  "+"
      return n1 + n2

    when "-"
      return n1 > n2 ? n1 - n2 : n2 - n1

    when "*"
      return n1*n2

    when "/"
      return n2 / n1
    end
end

puts calculate(10,20,"+")
puts calculate(10,20,"-")
puts calculate(10,20,"*")
puts calculate(10,20,"/")
