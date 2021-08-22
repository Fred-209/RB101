# # Convert a Number to a String!

# In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

# **RULES/REQUIREMENTS**

# *Input*: a number (integer)
# *Output*: a string

# *Explicit*: 
# - May not use any built in ruby methods for converting from integer to string
# - input integer will be positive or zero

# *Implicit*

# **EXAMPLES/TEST CASES**

# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# **DATA STRUCTURE**

# 4321 => '4321'

# **ALGORITHM**

# - Create a hash `CHARS` that maps integers to their string equivalents.
#   - ie: 0-9, 0 => '0', 1 => '1', etc.
# - Create an array whose elements are made up of the individual digits from the given integer
#   - ie: 1234 = [1, 2, 3, 4]
#   - create an empty array `num_array`
#   - set `temp` equal to the given integer
#   - Add the last digit of `temp` to the `num_array`
#     - The last digit can be gotten by input integer mod 10
#   - Make temp equal to dividing itself by 10
#     - This will remove the last digit from the integer, because of the way integer division works (no remainder)
#   - Repeat the last two steps while `temp` is greater than 0
#   - set a blank string variable `converted_string`
#   - Traverse `num_array`
#     - Match each element to the CHARS hash, and concatenate this value to `converted_string`
#   - Return `converted_string`
     




 CHARS = {
   0 => '0',
   1 => '1', 
   2 => '2',
   3 => '3', 
   4 => '4', 
   5 => '5', 
   6 => '6', 
   7 => '7', 
   8 => '8', 
   9 => '9'
 } 

#  def integer_to_string(input_integer)
#   return '0' if input_integer.zero?

#   num_array = []
#   converted_string = ''
#   temp = input_integer

#   while temp > 0
#     num_array.unshift(temp % 10)
#     temp /= 10
#   end

#   num_array.each { |number| converted_string << CHARS[number] }

#   converted_string
# end

# Using divmod

def integer_to_string(number)
  result = ''
  loop do 
    number, remainder = number.divmod(10)
    result.prepend(CHARS[remainder])
    break if number == 0
  end

  result
end




p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
