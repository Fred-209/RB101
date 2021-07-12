# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# You are not allowed to use #odd? or #even? in the solution

# **Rules/Requirements**

# Input: an integer
# Output: boolean

# Explicit: 
#   - The integer given will be a valid integer value
#   - There will only be one argument
#   - The integer can be positive, negative, or zero
#   - Return true if the given integer is odd

# **Examples/Test Cases**

# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# **Data Structure** 

# Just returning a boolean value, no real data structure to work with

# **Algorithm**

# - Get the absolute value of the given integer
#   - If given 'number' < 0 then multiply it by -1, otherwise it will already be the abs value
# - If number equals 0 return false
# - Use the modulo operation on the 'number', using 2 as the divisor
#   - If the answer to this is 0, then the number is even and program should return 'false', return true if the answer is anything other than 0

#   **Implementation**

def is_odd?(number)
  number *= -1 if number < 0
  number % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true



