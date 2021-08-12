# # Convert a String to a Number!

# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

# **RULES/REQUIREMENTS**

# *Input*: a string
# *Output* an integer

# *Explicit*: 

# - Input will only be numeric, no operators will be given like '+'
# - May not use ruby methods to convert from string to integer, like String#to_i

# *Implicit*: 

# **EXAMPLES/TEST CASES**

# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# **DATA STRUCTURE**

# '4567' => 4567

# **ALGORITHM**

# PROBLEMS:
# - Need to compare each digit of the given integer against a hash that contains integers as the values for key names that are corresponding to string_integer representations
#   - ie: '0' should map to 0, '1' should map to 1, all the way through '9'
#   - This will give me the individual digits as integers, but now i have individual integers instead of being combined together as one longer integer
#   - ie: say an array of [1, 2, 3, 4] instead of the integer 1234
#     - Need the elements of this array to be in the same order of the digits of the original input string
# - Now need to reconstruct the larger integer from an array of its digits
#   - The length/size of the array can be used as a reference to calculate from
#   1234
#     - The last digit will always be multipled by 1



# -create a constant hash that maps the string characters '0' - '9' as keys to their integer counterparts 0 - 9, `INTEGERS`, as the values
# - Create an empty array `integers_array`
# - Traverse the given string, `input_string`, character by character
#   - Check to see if the current character is one of the keys of the `INTEGERS` hash
#   - Add its corresponding INTEGERS value to the end of the`integers_array` array 
#   - Repeat the previous 2 steps until every character in the `input_string` has been iterated over
# - Use the `digit_combiner` method to combine the elements of `integers_array` into one integer composed of the individual elements as places in this new integer, ie: [1, 2, 3, 4] would be the integer 1234
#   - See below for `digit_combiner` method
# - Return the results of the return value from `digit_combiner` 


# *Method - digit_combiner*
# - Takes one argument, an array of integers, `int_array`
# - set `digits_place` to 1
# - set `combined_number` to 0
#   - Multiply the last element in `int_array` by `digits_place` and increment `combined_number` by this amount
#   - Multiply `digits_place` by 10 and increment it by this amount
#   - Remove the last element from `int_array`
#   - Repeat the previous 3 steps until `int_array` is empty
# - Return `combined_number`


HEX = {
  '0' => 0,
  '1' => 1, 
  '2' => 2, 
  '3' => 3, 
  '4' => 4, 
  '5' => 5, 
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9, 
  'A' => 10, 
  'B' => 11, 
  'C' => 12, 
  'D' => 13, 
  'E' => 14, 
  'F' => 15
}

# def digit_combiner(int_array)
#   digits_place = 1
#   combined_number = 0
#   counter = (int_array.length) -1

#   until counter < 0
#     combined_number += int_array[counter] * digits_place
#     digits_place *= 10
#     counter -= 1
#   end

#   combined_number
# end

# def string_to_integer(input_string)
#   int_array = []
#   input_string.each_char { |char| int_array << HEX[char]}
#   digit_combiner(int_array)
# end

# Refactored to use only one method instead of 2

def string_to_integer(string)
  digits = string.chars.map { |char| HEX[char]}
  
  value = 0
  digits.each { |digit| value = 10 * value + digit}
  value
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# To convert hexidecimal to integer

# - Convert all individual digits to their decimal equivalent 
# - Take the last digit (least significant), add it to the sum
# - Take next least significant digit, one to the left, multiply this by 16 and add it to the sum
# - Continue on with the next least significant digit, multiplying by 16^3, and adding to the sum
# - The process continues on in this way, moving up (to the left) the list of digits and adding a power to 16 each time to multiply by

def hexadecimal_to_integer(input_hex)
  digits = input_hex.upcase.chars.map { |char| HEX[char]}
  
  sum = digits.last
  digits.reverse.slice(1..-1).each_with_index do |digit, idx|
    p sum
    sum += digit * 16**(idx + 1)

  end
  
  sum
end

p hexadecimal_to_integer('4D9f') == 19871
