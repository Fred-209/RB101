# List of Digits

# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# **Rules/Requirements**

# Input: an integer
# Output: an array

# - One argument will be given
# - Given argument will be a positive integer
# - 
# **Examples/Test Cases**

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# **Data Structure**

# 123456  => [1, 2, 3, 4, 5, 6]

# **Algorithm**

# - Initialize an empty array, 'digits'
# - Initialize a loop iteration counter variable, 'counter', to 0
# - Convert the given 'number' to a string, 'number_string'
# - Extract the first element from 'number_string'
# - Convert it to an integer
# - Add it to the 'digits' array
# - Repeat this for each element/number in the 'number_string' array
# - return 'digits'

def digit_list(number)
  digits = []
  number_string = number.to_s
  counter = 0

  loop do
    break if counter == number_string.size
    current_digit = number_string[counter]
    digits.append(current_digit.to_i)
    counter += 1
  end

  digits
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
