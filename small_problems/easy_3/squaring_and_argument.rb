# Squaring an Argument

# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(num_1, num_2)
  num_1 * num_2
end

def square(number)
  multiply(number, number)
end

def exponential(number, power)
  number ** multiply(power, 1)
end


p exponential(5, 3) # == 125
p exponential(2, 4) # == 16