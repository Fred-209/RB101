# Array Average

# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

def average(numbers)
  result = 0
  numbers.each { |number| result += number}
  result / numbers.size
end
puts "Results from initial method:"
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Alternate using reduce
def average_2(numbers)
  sum = numbers.reduce{ |sum, num| sum + num}
  sum / numbers.size
end

puts
puts "Results from average_2 using reduce:"
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Alternate one liner using #sum
def average_3(numbers)
  numbers.sum / numbers.size
end

puts "Results using #sum and on one line:"

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Alternate with the average as a float instead of an integer:
def average_4(numbers)
  numbers.sum.to_f / numbers
end

puts "Results with average as a float:"
puts average([1, 6]) 
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
