# # Convert a Signed Number to a String!

# In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

# **RULES/REQUIREMENTS**

# *Input*: an integer (pos, neg, or zero)
# *Output*: a string

# *Explicit*: 
# - May not use built in Ruby conversion methods

# *Implicit*: 
# - Input integer can be positive, negative, or zero
# - If the input integer is negative, the returned string must have a '-
#  in front of it
# - The returned string should have a '+' in front of it if the given integer is positive
# - If the given integer is 0, the returned string should have neither a '+' or '-' in front of it

# **EXAMPLES**

# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

# **DATA STRUCTURE**

# **ALGORITHM**



# - Create a `DIGITS` array that is equal to the integers 0-9 as the keys, and the corresponding string representation of that integer as its value

# - Create `signed_integer_to_string` method with `number` as its sole parameter
#   - Set `number_abs` equal to the absolute value of `number`
#   - set `temp_number` equal to `number_abs`
#   - Create an empty string variable `result`

#   - Break down the given integer into its individual digits
#     - Start a loop
#       - Calculate the result of `temp_number mod 10` 
#         - Prepend the element from DIGITS that is at the index of the result from this calculation
      
#       - Reassign `temp_number` to be equal to itself divided by 10 (integer division)
#       - Break the loop if `temp_number` is == 0

#   - If given integer `number` is < 0, prepend '-' to `result`
#   - IF `number` is > 0, prepend '+' to `result`
#   - Return `result`


DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def signed_integer_to_string(number)
  number_abs = number.abs
  temp_number = number_abs
  result = ''

  loop do
    result.prepend(DIGITS[temp_number % 10])
    temp_number /= 10
    break if temp_number.zero?
  end

  case
  when number > 0
    result.prepend('+')
  when number < 0 
    result.prepend('-')
  else
    result
  end
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
