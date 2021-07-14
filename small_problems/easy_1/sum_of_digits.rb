# Sum of Digits 

# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# Initial method of solving the problem

def sum(number)
  number.to_s.chars.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 455

