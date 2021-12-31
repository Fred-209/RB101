# solved on 12/29 in 53 min
# - typos caused the slowdown

# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

# **Rules/Requirements**

# *Input*: integer

# *Output*: intger


# *Explicit Requirements*: 
# - output must be a multiple of 7
# - output must be greater than the given number
# - output must not have duplicate digits
# - output must be the next 'featured' number, meaning it fits the above criteria
# - return an error message stating There is no possible number that fulfills those requirements" if no possible number is found
# *Implicit Requirements*: 
#  - 


# *Questions:*
# - Do I need to consider negative input?
# - How to know when to stop searching for a number?
#   - if the number of digits are greater than 10\
#     - aka 1 trillion
    
# *Edge Cases*:
# - 


# **Examples/Test Cases**
# ```ruby
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
# ```

# **Data Structure**
# Initial: integer

# Intermediate: range of numbers from 1 greater than the given number through 9_999_999_999

# Final: integer or 



# **Algorithm**

# *High level thought process / brainstorming ideas
# - have empty variable flag `featured_number` set to error message
# - set an upper limit number to 1 trillion
# - find the first number greater than the given number that is a multiple of 7
#   - then can iterate over a range from this number (if its not the feature number) 
#     through the `upper_limit` going 7 numbers at a time
#   - use helper method to find this number**

# - Check each numbe for the criteria of: 
#   - odd number
#   - multiple of 7
#   - digits in number appear only once
# - If they meet this criteria, reassign `featured_number` to this value
# - return `featured_number`
# - Checking for duplicate digits:
#   - convert number to an array of string digits
#   - remove all duplicates from this array and see if it equals the original
# *find first number greater than given number that is a multiple of 7*(possible_number)
# - increment possible_number by 1
# - Iterate 7 times
#   - return the possible number if it's divisible by 7
# *

# *Lower level steps of implementation*
# - init `featured_number` to "There is no possible number that fulfills those requirements"
# - init UPPER_LIMIT to 1_000_000_000_000
# - init first_number to the result of calling helper method next_multiple_7 and passing in the given number as an argument
# - Iterate over a range from first_number through UPPER_LIMIT, stepping 7 each time
#   - convert given number into an array of digits, `digit_array`
#   - call uniq on `digit_array` and see if its equal to the `digit_array`
#   - if it is equal, this is the number we want so reassign feature number to the current number in iteration, and break out of the loop
# - return `featured_number`
  
# * next_multiple_of_7(possible_number)
# - increment possible_number by 7
# - Loop 7 times
#   - return possible_number if number / 7 has no remainder
#   - increment possible_number by 1

# **Code Implementation**

require 'pry'

UPPER_LIMIT = 10_000_000_000

def featured(number)
  featured_number = "There is no possible number that fulfills those requirements"
  
  
  first_number = next_multiple_of_7(number)
  first_number.step(by: 7) do |possible_number|
    break if possible_number >= UPPER_LIMIT
    next unless possible_number.odd?
      
    digits_array = possible_number.to_s.chars
    if digits_array ==  digits_array.uniq
      featured_number = possible_number
      break
    end
  end
  featured_number
end

def next_multiple_of_7(possible_num)
  possible_num += 1
  
  7.times do |_|
    return possible_num if possible_num % 7 == 0
    possible_num += 1
  end
end



p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987 
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements


